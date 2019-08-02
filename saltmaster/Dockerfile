FROM ubuntu:18.04
MAINTAINER Warpnet Beheer <beheer@warpnet.nl>

# Configure TZdata
RUN ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

# Installation of the latest salt
RUN sed -i 's/archive.ubuntu/nl.archive.ubuntu/' /etc/apt/sources.list
RUN apt update
RUN apt install -y wget curl software-properties-common vim sudo net-tools iputils-ping netcat
RUN wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo 'deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main' > /etc/apt/sources.list.d/saltstack.list
RUN apt update
RUN apt dist-upgrade -y

# Install the salt master
RUN apt install salt-master -y

# Mount /srv/salt and /srv/pillar
VOLUME ["/srv/salt","/srv/pillar"]

# Add run file
ADD run_saltmaster.sh /usr/local/bin/run_saltmaster.sh
RUN chmod +x /usr/local/bin/run_saltmaster.sh

# Ports to expose
EXPOSE 4505 4506

# Last command to run
CMD "/usr/local/bin/run_saltmaster.sh"
