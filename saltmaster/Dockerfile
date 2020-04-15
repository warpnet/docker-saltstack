FROM ubuntu:18.04
LABEL maintainer="info@warpnet.nl"

# Set shell option -o before running shell commands with pipes in them
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    sudo \
    gpg-agent \
    dirmngr \
  && rm -rf /var/lib/apt/lists/*

# Add SaltStack repository
RUN apt-key adv --fetch-keys https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub
RUN echo 'deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main' > /etc/apt/sources.list.d/saltstack.list

# Install the salt master
# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    salt-master \
  && rm -rf /var/lib/apt/lists/*

# Add run file
COPY run_saltmaster.sh /usr/local/bin/run_saltmaster.sh
RUN chmod +x /usr/local/bin/run_saltmaster.sh

# Ports to expose
EXPOSE 4505 4506

# Last command to run
CMD ["/usr/local/bin/run_saltmaster.sh"]
