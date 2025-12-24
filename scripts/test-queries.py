#!/usr/bin/env python3
""""
Tests the queries in a CartoCSS MML file against a database.

Ignore database settings in the MML file.
"""
import argparse
import logging
import psycopg2
import yaml

EMPTY_POLYGON="""ST_SetSRID('POLYGON EMPTY'::geometry, 3857)"""

class ResultHasRowsError(Exception):
    """Class for layers that have """
    pass

def testLayer(layer, curs):
    datasource = layer["Datasource"]
    if datasource["type"] != "postgis":
        logging.warning("Layer type {} not supported".format(layer["type"]))
        return
    geometry_field=datasource["geometry_field"]

    full_query = """
    SELECT "{}" FROM
    {}
    """.format(geometry_field, datasource["table"])
    if "!bbox!" not in full_query:
        full_query += "\nWHERE {} && !bbox!".format(geometry_field)

    query = full_query.replace("!bbox!", EMPTY_POLYGON).replace("!pixel_width!", "0").replace("!pixel_height!", "0").replace("!scale_denominator!", "0")
    logging.debug("Running query {}".format(query))
    curs.execute(query)
    if curs.rowcount != 0:
        raise ResultHasRowsError(query)

def main():
    # parse options
    parser = argparse.ArgumentParser(
             description="Test CartoCSS project queries against a database")


    parser.add_argument("-d", "--database", action="store", default="gis",
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

    parser.add_argument('project', type=argparse.FileType('r'),
                        help="CartoCSS MML file")
    opts = parser.parse_args()

    if opts.verbose:
        logging.basicConfig(level=logging.DEBUG)
    elif opts.quiet:
        logging.basicConfig(level=logging.WARNING)
    else:
        logging.basicConfig(level=logging.INFO)

    mml=yaml.safe_load(opts.project)
    logging.debug("Loaded MML")

    with psycopg2.connect(database=opts.database, host=opts.host,
                          port=opts.port, user=opts.username,
                          password=opts.password).cursor() as curs:
        curs.execute("SET default_transaction_read_only = TRUE;")
        for layer in mml["Layer"]:
            testLayer(layer, curs)




if __name__ == '__main__':
    main()
