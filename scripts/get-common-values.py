#!/usr/bin/env python3
# This script generates list of popular values for a given key in OpenStreetMap database according to taginfo
# It is used to creating/update a database table to determine which key value pairs will be rendered

import sys
import copy
import yaml
import argparse
from itertools import count
from collections import OrderedDict
import urllib.request
import json
import logging

page_size = 200

def get_common_values(key, min_count, settings, exclude):

    candidates = []
    taginfo_url = settings["taginfo_url"]
    max_page = settings.get("max_page", 100)
    all_exclude = set(settings["common_exclusions"]).union(exclude)
    logging.debug(f"   Excluded tags for {key}: {all_exclude}")
    found = set()

    def check_include(x):
        """ Check whether a taginfo object should be included as valid candidate """
        if x["count"] < min_count:
            return False
        tag = x["value"]
        if (len(tag.strip()) == 0) or (';' in tag):
            return False
        if tag in all_exclude:
            found.add(tag)
            return False
        return True

    for page in count(1):
        url = f'{taginfo_url}/values?key={key}&sortname=count&sortorder=desc&rp={max_page}&page={page}'
        logging.debug("   Opening "+ url)
        request = urllib.request.Request(url=url, headers={'User-Agent': 'get-common-values.py/osm-carto'})
        with urllib.request.urlopen(request) as url:
            page_data = json.loads(url.read().decode())
            page_data = page_data["data"]
            if (len(page_data) == 0) or (page_data[0]["count"] < min_count):
                break
            candidates += [x["value"] for x in page_data if check_include(x)]

    notfound = exclude - found
    if notfound:
        logging.info(f"  Did not find these excluded values above threshold for {key}: " + ",".join(notfound))
    if not candidates:
        logging.critical(f"  No valid values for key {key}")
    # Output in SQL style
    logging.info(f"  Found {len(candidates)} matches for key {key}")
    return candidates


def main():
    # parse options
    parser = argparse.ArgumentParser(
        description="Get key frequency information from taginfo")

    parser.add_argument("-c", "--config", action="store", default="common-values.yml",
                        help="Name of configuration file (default common-values.yml)")
    parser.add_argument("--no-update", action="store_true",
                        help="Don't update database. Only show values that would be uploaded.")
    parser.add_argument("-d", "--database", action="store",
                        help="Override database name to connect to")
    parser.add_argument("-H", "--host", action="store",
                        help="Override database server host or socket directory")
    parser.add_argument("-p", "--port", action="store",
                        help="Override database server port")
    parser.add_argument("-U", "--username", action="store",
                        help="Override database user name")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Be more verbose. Overrides -q")
    parser.add_argument("-q", "--quiet", action="store_true",
                        help="Only report serious problems")
    parser.add_argument("-w", "--password", action="store",
                        help="Override database password")
    parser.add_argument("-R", "--renderuser", action="store",
                        help="User to grant access for rendering")

    opts = parser.parse_args()

    if opts.verbose:
        logging.basicConfig(level=logging.DEBUG)
    elif opts.quiet:
        logging.basicConfig(level=logging.WARNING)
    else:
        logging.basicConfig(level=logging.INFO)

    results = dict()
    with open(opts.config) as config_file:
        config = yaml.safe_load(config_file)

        keys = config.get("keys")
        if keys is None or not keys:
            logging.critical("  No keys specified in configuration file")
            sys.exit()

        # If the DB options are unspecified in both on the command line and in the
        # config file, libpq will pick what to use with the None
        database = opts.database or config["settings"].get("database")
        host = opts.host or config["settings"].get("host")
        port = opts.port or config["settings"].get("port")
        user = opts.username or config["settings"].get("username")
        password = opts.password or config["settings"].get("password")
        renderuser = opts.renderuser or config["settings"].get("renderuser")

    for key, val in keys.items():
        logging.info(f"  Obtaining frequency information for key {key}")
        specific_exclusions = set(val.get("exclusions", []))
        results[key] = get_common_values(key, val["min_count"], settings=config["settings"], exclude=specific_exclusions)

if __name__ == '__main__':
    main()
