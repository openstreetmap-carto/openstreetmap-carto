FROM ubuntu:noble

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
# 5dbde8db6b5e22073951066b0646a91c10bb81a5 is master's tip as of 2024-11-17.
RUN npm set prefix /usr && npm install -g --unsafe-perm "git+https://git@github.com/kosmtik/kosmtik.git#5dbde8db6b5e22073951066b0646a91c10bb81a5"

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
