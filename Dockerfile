FROM debian:stretch AS base

ENV FS_MAJOR 1.10 \
    FS_VERSION 1.10.2 \
    REFRESHED_AT 2020-01-27 

RUN apt update && apt -y --quiet upgrade && apt install -y --quiet gnupg2 wget \
    && wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add - \
    && echo "deb http://files.freeswitch.org/repo/deb/debian-release/ stretch main" > /etc/apt/sources.list.d/freeswitch.list \
    && echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ stretch main" >> /etc/apt/sources.list.d/freeswitch.list \
    && apt update && apt clean && rm -rf /var/lib/apt/lists/*

RUN groupadd -r freeswitch && useradd -r -g freeswitch freeswitch

# vim:set ft=dockerfile:
# Install FreeSWITCH with vanilla config
FROM base

RUN apt -y --quiet update && apt install -y --quiet freeswitch-meta-all \
    && cp -a /usr/share/freeswitch/conf/vanilla /etc/freeswitch \
    && rm -rf /usr/share/freeswitch/conf \
    && mkdir -p /docker-entrypoint.d /certs /db /recordings /scripts /var/lib/freeswitch /var/run/freeswitch \
    && apt clean && rm -rf /var/lib/apt/lists/*

COPY docker-entry.sh /

ENTRYPOINT ["/docker-entry.sh"]

CMD ["freeswitch"]