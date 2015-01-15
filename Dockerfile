## trading standalone
FROM ubuntu:14.04
MAINTAINER andre@tradingeconomics.com

# install requirements
ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt-get install -y build-essential && \
	sudo docker run -i -t ubuntu /bin/bash


COPY start.sh start.sh
CMD ["/bin/bash", "start.sh"]
