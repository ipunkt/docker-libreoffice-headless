FROM ubuntu:18.04

LABEL maintainer="r.kummer@ipunkt.biz" \
	  version.ubuntu="18.04"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get -y -q install \
		libreoffice \
		libreoffice-writer \
		ure \
		libreoffice-java-common \
		libreoffice-core \
		libreoffice-common \
		openjdk-8-jre \
		fonts-opensymbol \
		hyphen-fr \
		hyphen-de \
		hyphen-en-us \
		hyphen-it \
		hyphen-ru \
		fonts-dejavu \
		fonts-dejavu-core \
		fonts-dejavu-extra \
		fonts-droid-fallback \
		fonts-dustin \
		fonts-f500 \
		fonts-fanwood \
		fonts-freefont-ttf \
		fonts-liberation \
		fonts-lmodern \
		fonts-lyx \
		fonts-sil-gentium \
		fonts-texgyre \
		fonts-tlwg-purisa && \
	apt-get -y -q remove libreoffice-gnome && \
	apt -y autoremove

RUN adduser --home=/opt/libreoffice --disabled-password --gecos "" --shell=/bin/bash libreoffice

ADD entrypoint.sh /opt/libreoffice/entrypoint.sh
RUN chmod +x /opt/libreoffice/entrypoint.sh

VOLUME ["/tmp"]
WORKDIR "/tmp"

ENTRYPOINT ["/opt/libreoffice/entrypoint.sh"]
