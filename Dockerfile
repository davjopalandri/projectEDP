FROM ubuntu

RUN apt-get update && apt-get install -y imagemagick

RUN apt-get install -y curl

WORKDIR /app

ADD scripts scripts

ENTRYPOINT ["bash", "scripts/menu.sh"]


