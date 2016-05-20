FROM ubuntu:14.04

RUN apt-get update \
 && apt-get install -y software-properties-common p7zip-full \
 && add-apt-repository -y ppa:modriscoll/nzbget && add-apt-repository -y multiverse && apt-get update \
 && apt-get install -y unrar nzbget \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && useradd --system -u 236 -M --shell /usr/sbin/nologin nzbget

COPY start.sh /start.sh
RUN chmod +x /start.sh

USER nzbget
CMD /start.sh
VOLUME /config
EXPOSE 6789