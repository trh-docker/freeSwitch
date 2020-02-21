FROM quay.io/spivegin/tlmbasedebian

ENV FS_MAJOR 1.10 \
    FS_VERSION 1.10.2 \
    REFRESHED_AT 2020-01-27 

RUN apt update && apt -y --quiet upgrade && apt install -y --quiet gnupg2 wget \
    && wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add - \
    && echo "deb http://files.freeswitch.org/repo/deb/debian-release/ stretch main" > /etc/apt/sources.list.d/freeswitch.list \
    && echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ stretch main" >> /etc/apt/sources.list.d/freeswitch.list \
    && apt update && apt clean && rm -rf /var/lib/apt/lists/*

RUN groupadd -r freeswitch && useradd -r -g freeswitch freeswitch