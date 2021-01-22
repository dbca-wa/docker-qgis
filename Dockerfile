FROM debian:sid
LABEL org.opencontainers.image.source https://github.com/dbca-wa/docker-qgis
LABEL maintainer "DBCA ASI <asi@dbca.wa.gov.au>"

RUN apt-get -y update; apt-get -y install gnupg software-properties-common wget curl git vim; \
    wget -qO - https://qgis.org/downloads/qgis-2020.gpg.key | gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/qgis-archive.gpg --import; \
    chmod a+r /etc/apt/trusted.gpg.d/qgis-archive.gpg; \
    add-apt-repository -y "deb https://qgis.org/debian `lsb_release -c -s` main"

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install qgis qgis-plugin-grass qgis-server gdal-bin
