FROM ubuntu:26.04

# https://serverfault.com/questions/949991/how-to-install-tzdata-on-a-ubuntu-docker-image
ARG DEBIAN_FRONTEND=noninteractive

# Style dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates gnupg postgresql-client curl unzip python3 \
    nodejs npm git fonts-unifont mapnik-utils \
    && rm -rf /var/lib/apt/lists/*

# Kosmtik with plugins, forcing prefix to /usr because Ubuntu sets
# npm prefix to /usr/local, which breaks the install
# We install kosmtik not from release channel, but directly from a specific commit on github.
# Upstream kosmtik/kosmtik is unmaintained, so this uses a fork that bumps
# @mapnik/mapnik to 4.8.0 (Mapnik 4.3.0, which adds the !unbuffered_bbox! SQL
# token) and carries assorted rendering/UI fixes on top of upstream master.
RUN npm set prefix /usr \
    && npm install -g @mapnik/core-linux-x64@4.3.0 \
    && npm install -g --unsafe-perm "git+https://git@github.com/leijurv/kosmtik.git#716d585c18c48903ff891bfd342101bc6e9a0c3f"

WORKDIR /usr/lib/node_modules/kosmtik/
RUN kosmtik plugins --install kosmtik-overpass-layer \
                    --install kosmtik-fetch-remote \
                    --install kosmtik-overlay \
                    --install kosmtik-open-in-josm \
                    --install kosmtik-map-compare \
                    --install kosmtik-osm-data-overlay \
                    --install kosmtik-mapnik-reference \
                    --install kosmtik-geojson-overlay \
    && cp /root/.config/kosmtik.yml /tmp/.kosmtik-config.yml

# Closing section
RUN mkdir -p /openstreetmap-carto
WORKDIR /openstreetmap-carto

USER 1000
CMD sh scripts/docker-startup.sh kosmtik
