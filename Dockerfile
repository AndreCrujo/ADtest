## trading standalone
FROM ubuntu:14.04
MAINTAINER andre@tradingeconomics.com

# install requirements
ENV DEBIAN_FRONTEND noninteractive


COPY start.sh start.sh
CMD ["/bin/bash", "start.sh"]
