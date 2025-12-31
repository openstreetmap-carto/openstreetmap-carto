#!/usr/bin/env python3
# This script generates list of popular values for a given key in OpenStreetMap database according to taginfo
# It is used to creating/update a database table to determine which key value pairs will be rendered

import sys
import yaml
import argparse
from itertools import count
import urllib.request
import json

configfilename = 'common-values.yml'
tablename = 'carto_POIs'


def get_common_values(key, min_count, settings, exclude, verbose):

    candidates = []
    taginfo_url = settings["taginfo_url"]
    max_page = settings.get("max_page", 100)
    all_exclude = set(settings["common_exclusions"]).union(exclude)
    found = set()

    def check_include(x):
        """ Check whether a taginfo object should be included as valid candidate """
        if x["count"] < min_count:
            return False
        tag = x["value"]
        if ' ' in tag:
            return False
        if tag in all_exclude:
            found.add(tag)
            return False
        return True

    for page in count(1):
        url = f'{taginfo_url}/values?key={key}&sortname=count&sortorder=desc&rp={max_page}&page={page}'
        request = urllib.request.Request(url=url, headers={'User-Agent': 'get-common-values.py/osm-carto'})
        with urllib.request.urlopen(request) as url:
            page_data = json.loads(url.read().decode())
            page_data = page_data["data"]
            if (len(page_data) == 0) or (page_data[0]["count"] < min_count):
                break
            candidates += [x["value"] for x in page_data if check_include(x)]

    notfound = all_exclude - found
    if not candidates:
        sys.exit(f"No valid values found for key {key}")
    if verbose and notfound:
        print(f"Note: did not find these excluded values above threshold for {key}: " + ", ".join(notfound), file=sys.stderr)

    return candidates


def main():
    # parse options
    parser = argparse.ArgumentParser(
        description="Get key frequency information from taginfo.")

    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Be more verbose.")
    parser.add_argument("-R", "--renderuser", action="store",
                        help="User to grant access for rendering (overwrites configuration file)")

    opts = parser.parse_args()

    with open(configfilename) as config_file:
        config = yaml.safe_load(config_file)

        keys = config.get("keys")
        if keys is None or not keys:
            sys.exit("No keys specified in configuration file")

        renderuser = opts.renderuser or config["settings"].get("renderuser")
        schema = config["settings"].get("schema", "public")

    results = dict()
    for key, val in keys.items():
        specific_exclusions = set(val.get("exclusions", []))
        results[key] = get_common_values(key, val["min_count"],
                                         settings=config["settings"],
                                         exclude=specific_exclusions,
                                         verbose=opts.verbose)

    print("-- This is generated code; it is not recommended to change this file manually.")
    print(f"-- To update the contents, review settings in {configfilename} and run:")
    print("-- scripts/get-common-values.py > common-values.sql")
    print("-- Use psql to execute the generated SQL and recreate the POI table")

    print(f'DROP TABLE IF EXISTS {schema}.{tablename};')
    print(f'''CREATE TABLE {schema}.{tablename} (\n'''
            '''    key text NOT NULL,\n'''
            '''    value text NOT NULL,\n'''
            '''    PRIMARY KEY (key, value));''')
    if renderuser is not None:
        print(f'GRANT SELECT ON {schema}.{tablename} TO {renderuser};')

    for key, vals in results.items():
        def pretty_print(val):
            return f"('{key}', '{val}')"

        print(f'INSERT INTO {schema}.{tablename} (key, value) VALUES')
        end_item = len(vals) - 1
        for ind, item in enumerate(vals):
            endstr = ';' if ind == end_item else ','
            print(f"    {pretty_print(item)}{endstr}")


if __name__ == '__main__':
    main()
