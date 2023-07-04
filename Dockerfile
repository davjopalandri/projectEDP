FROM ubuntu

RUN apt-get update && apt-get install -y imagemagick

WORKDIR tp-edp

RUN mkdir -p scripts

ADD ./scripts/menu.sh ./scripts/menu.sh

ENTRYPOINT ["bash", "scripts/menu.sh"]


