FROM ubuntu:16.04
MAINTAINER Warpnet Beheer <beheer@warpnet.nl>


# Installation of the latest salt
RUN sed -i 's/archive.ubuntu/nl.archive.ubuntu/' /etc/apt/sources.list
RUN apt update
RUN apt install -y wget curl software-properties-common vim sudo net-tools iproute iputils-ping netcat
RUN echo 'deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main' > /etc/apt/sources.list.d/saltstack.list
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN apt update
RUN apt dist-upgrade -y

# Install the salt master
RUN apt install salt-minion -y

# Add run file
ADD run_saltminion.sh /usr/local/bin/run_saltminion.sh
RUN chmod +x /usr/local/bin/run_saltminion.sh

# Ports to expose
EXPOSE 4505 4506

# Last command to run
CMD "/usr/local/bin/run_saltminion.sh"
