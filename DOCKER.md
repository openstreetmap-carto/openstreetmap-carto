# Running OpenStreetMap Carto with Docker

[Docker](https://www.docker.com/) is a virtualized environment running a [_Docker daemon_](https://docs.docker.com/get-started/overview/), in which you can run software without altering your host system permanently. The software components run in _containers_ that are easy to setup and tear down individually. The Docker demon can use operating-system-level virtualization (Linux, Windows) or a virtual machine (macOS, Windows).

This enables easily setting up a development environment for OpenStreetMap Carto. Specifically, this environment consists of a
PostgreSQL database to store the OpenStreetMap data and [Kosmtik](https://github.com/kosmtik/kosmtik) for previewing the style.

## Prerequisites

* Docker is available for Linux, macOS and Windows. [Install](https://www.docker.com/products/docker-desktop/) the software packaged for your host system in order
to be able to run Docker containers. You also need Docker Compose, which should be available once you install
Docker itself. Otherwise, you need to [install Docker Compose manually](https://docs.docker.com/compose/install/).

* You need sufficient disk space of _several Gigabytes_.
	* Docker creates a disk image for its virtual machine that holds the virtualised operating system and the containers.
	* The format (Docker.raw, Docker.qcow2, \*.vhdx, etc.) depends on the host system. It can be a sparse file allocating large amounts of disk space, but still the physical size starts with 2-3 GB for the virtual OS and grows to 6-7 GB when filled with the containers needed for the database, Kosmtik, and a chosen small region of OSM data.
	* An additional 1-2 GB are needed for shapefiles to be downloaded and stored in the openstreetmap-carto/data repository.

## Quick start

If you are eager to get started, here is an overview over the necessary steps:

* `git clone https://github.com/gravitystorm/openstreetmap-carto.git` to clone openstreetmap-carto repository into a directory on your host system
* Download OpenStreetMap data in osm.pbf format to a file `data.osm.pbf` and place it within the openstreetmap-carto directory (for example some small area from [Geofabrik](https://download.geofabrik.de/))
* If necessary, `sudo service postgresql stop` to make sure you don't have a currently-running native PostgreSQL server which would conflict with Docker's PostgreSQL server.
* `docker-compose up import` to import the osm.pbf data file and download additional external data (only necessary the first time or when you change the data file). Additionally, you can set import options through [environment variables](#Importing-data). More on that [later](#Hands-on-approach)
* `docker-compose up kosmtik` to run the style preview application
* Browse to [http://127.0.0.1:6789](http://127.0.0.1:6789) to view the output of Kosmtik
* Ctrl+C to stop the style preview application
* `docker-compose stop db` to stop the database container

## Repositories

The instructions above will clone the main OpenStreetMap Carto repository. To test your own changes, you should [fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) gravitystorm/openstreetmap-carto repository and [clone your fork](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository).

This OpenStreetMap Carto repository needs to be a directory that is shared between your host system and the Docker virtual machine. Home directories are shared by default; if your repository is in another place you need to add this to the Docker sharing list (e.g. macOS: Docker Preferences > File Sharing; Windows: Docker Settings > Shared Drives).

## Importing data

OpenStreetMap Carto needs a database populated with rendering data to work. You first need a data file to import.
For testing purposes, it's probably easiest to grab a PBF export of OSM data from [Geofabrik](https://download.geofabrik.de
Once you have that file put it into the openstreetmap-carto directory and run `docker-compose up import` in the openstreetmap-carto directory.
This starts the PostgreSQL container (downloads it if it not exists) and starts a container that runs [osm2pgsql](https://github.com/openstreetmap/osm2pgsql) to import the data. The container is built the first time you run that command if it not exists.
At startup of the container the script `scripts/docker-startup.sh` is invoked which prepares the database and itself starts osm2pgsql for importing the data. Then the `scripts/get-external-data.py` is called to download and import needed shapefiles.

### Supplying command line options as environment variables

**osm2pgsql** has a few [command line options](https://manpages.debian.org/testing/osm2pgsql/osm2pgsql.1.en.html) and the import by default uses a RAM cache of 512 MB, 1 worker, **and expects the import file to be named `data.osm.pbf`**.
If you want to customize any of these parameters, you have to set any number of the following environment variables:
* `OSM2PGSQL_CACHE` (e.g. `export OSM2PGSQL_CACHE=1024` on Linux to set the cache to 1 GB) for the RAM cache (the value depends on the amount of RAM you have available - the more you can use here the faster the import may be)
* `OSM2PGSQL_NUMPROC` for the number of workers (this depends on the number of processors you have and whether your hard disk is fast enough e.g. is a SSD)
* `OSM2PGSQL_DATAFILE` if your file has a different name

You can also [tune the **PostgreSQL**](https://wiki.postgresql.org/wiki/Tuning_Your_PostgreSQL_Server) during the import phases, with `PG_WORK_MEM` (default to 16MB) and `PG_MAINTENANCE_WORK_MEM` (default to 256MB), which will eventually write `work_mem` and `maintenance_work_mem` to the `postgresql.auto.conf` once, making them applied each time the database started. Note that unlike osm2pgsql variables, once thay are set, you can only change them by running `ALTER SYSTEM` on your own, changing `postgresql.auto.conf` or remove the database volume by `docker-compose down -v && docker-compose rm -v` and import again.

**get-external-data.py script** has option `-C (--cache)` to save data after download (useful when you are tinkering with docker and ending up deleting volumes).
It also has option `--no-update` to stop program from downloading newer versions of shapefiles if you don't deem updating them necessary. Best used in conjunction with `-C`.
If everything goes out of the window, option `--force` will forcefully download data and import it. Option `--force-import` will try to force just import part.
Use `EXTERNAL_DATA_SCRIPT_FLAGS` env variable to pass those options. For example:
```
EXTERNAL_DATA_SCRIPT_FLAGS="--cache --no-update"
```
will keep data you downloaded and not update them (saving you on bandwidth) until you change this options.

### Hands on approach

If you want to customize and remember the values, supply it during your first import:

```
PG_WORK_MEM=128MB PG_MAINTENANCE_WORK_MEM=2GB \
OSM2PGSQL_CACHE=2048 OSM2PGSQL_NUMPROC=4 \
OSM2PGSQL_DATAFILE=taiwan.osm.pbf \
EXTERNAL_DATA_SCRIPT_FLAGS="--cache --no-update" \
docker-compose up import
```

Note that on Linux you need to export those environment variables before calling `docker-compose`. If you are using sudo to call docker (because your user is not in the docker group (which we don't recommend)), you need to also use sudo -E option

Variables will be remembered in `.env` if you don't have that file, and values in the file will be applied unless you manually assign them. Keep in mind this means if you change your `.env` file, but keep your environment variables untouched (you haven't unset them or you haven't rebooted your host), they will be used instead of anything that you changed in `.env`.

Depending on your machine and the size of the extract the import can take a while. When it is finished you should have the data necessary to render it with OpenStreetMap Carto.

## Test rendering

After you have the necessary data available you can start Kosmtik to produce a test rendering. To do that, run `docker-compose up kosmtik` in the openstreetmap-carto directory. This starts a container with Kosmtik and also starts the PostgreSQL database container if it is not already running. The Kosmtik container is built the first time you run the command if it does not yet exist.
When the container starts, the script `scripts/docker-startup.sh` is invoked, which downloads supplemental shapefiles specified in `scripts/get-external-data.py` (if they are not already present). Afterward, it runs the Kosmtik server. If you have to customize anything, you can do so in the script. The Kosmtik config file can be found in `.kosmtik-config.yml`.
If you want to have a [local configuration](https://github.com/kosmtik/kosmtik#local-config) for your `project.mml`, you can place a `localconfig.js` or `localconfig.json` file into the openstreetmap-carto directory.

The shapefile data that is downloaded is owned by the user with UID 1000. If you have another default user id on your system, consider changing the line `USER 1000` in the file `Dockerfile`.

After startup is complete you can browse to [http://127.0.0.1:6789](http://127.0.0.1:6789) to use the Kosmtik web tool. You can stop the container by pressing Ctrl+C on the command line used to start the container. If this happens, the PostgreSQL database container is still running (you can check with `docker ps`). If you want to stop the database container as well, you can do so by running `docker-compose stop db` in the openstreetmap-carto directory.

## Troubleshooting

Importing the data needs a substantial amount of RAM in the virtual machine. If you find the import process (Reading in file: data.osm.pbf, Processing) being _killed_ by the Docker demon, exiting with error code 137, increase the Memory assigned to Docker (e.g. macOS: Docker Preferences / Windows: Docker Settings > Advanced > Adjust the computing resources).

Docker copies log files from the virtual machine into the host system, their [location depends on the host OS](https://stackoverflow.com/questions/30969435/where-is-the-docker-daemon-log). E.g. the 'console-ring' appears to be a ringbuffer of the console log, which can help to find reasons for killings.

While installing software in the containers and populating the database, the disk image of the virtual machine grows in size, by Docker allocating more clusters. When the disk on the host system is full (only a few MB remaining), Docker can appear stuck. Watch the system log files of your host system for failed allocations.

Docker stores its disk image by default in the home directory of the user. If you don't have enough space here, you can move the images elsewhere. (E.g. macOS: Docker > Preferences > Disk).

## Style Debugging

When working with the style's database tables after an import, it can be helpful to log in at the [console](https://www.postgresql.org/docs/current/app-psql.html) to inspect the table structure or view imported data. The following command will open a psql console on the database:

```
docker-compose exec -e PGUSER=postgres -e PGDATABASE=gis db psql
```
