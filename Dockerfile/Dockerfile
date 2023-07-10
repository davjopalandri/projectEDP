#Dockerfile

FROM ubuntu

RUN apt-get update && apt-get install -y imagemagick git wget zip

WORKDIR tp-edp

RUN mkdir -p scripts
#RUN git clone https://github.com/davjopalandri/projectEDP.git

ADD ./scripts/menu.sh ./scripts/menu.sh

ENTRYPOINT ["bash","scripts/menu.sh"]
