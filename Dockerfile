## trading standalone
FROM ubuntu:14.04
MAINTAINER andre@tradingeconomics.com

# install requirements
ENV DEBIAN_FRONTEND noninteractive
RUN \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
#ADD root/.bashrc /root/.bashrc
#ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts

# Set environment variables.
ENV HOME /root

# Install dependencies
RUN \
	sudo apt-get install g++ make
	vim ~/.npmrc
	root = ~/.local/lib/node_modules
	binroot = ~/.local/bin
	manroot = ~/.local/share/man
	mkdir ~/.local
	wget https://github.com/joyent/node/archive/v0.10.29.tar.gz ~/	
	tar -xzvf ~/v0.10.29.tar.gz
	cd ~/node-0.10.29
	./configure --prefix=~/.local
	make
	make install	
	ln -s ~/.local/lib/node_modules ~/.node_modules	
	export PATH=$HOME/.local/bin:$PATH
	node -v
	npm -v
	rm -R /home/nodejs-0.10.x/node-0.10.29
	rm /home/nodejs-0.10.x/v0.10.29.tar.gz
	
# Install Node.js
#RUN \
#  cd /tmp && \
#  wget http://nodejs.org/dist/v0.10.29/node-v0.10.29-linux-x64.tar.gz && \
#  tar xvzf node-v0.10.29-linux-x64.tar.gz && \
#  rm -f node-v0.10.29-linux-x64.tar.gz && \
#  cd node-v* && \
#  ./configure && \
#  CXX="g++ -Wno-unused-local-typedefs" make && \
#  CXX="g++ -Wno-unused-local-typedefs" make install && \
#  cd /tmp && \
#  rm -rf /tmp/node-v* && \
#  npm install -g npm && \
#  echo -e '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

# Trading API
EXPOSE 3001

# Add HBASE to path
#ENV PATH /opt/hbase/bin:$PATH

COPY start.sh start.sh
CMD ["/bin/bash", "start.sh"]

# Launch HBASE on Container Start
# CMD ["hbase", "master", "start"]
# CMD ["/opt/hbase/bin/hbase", "master", "start"]
# CMD ["/bin/sh", "/opt/hbase/bin/start-hbase.sh"]