[![Travis (.org)](https://img.shields.io/travis/warpnet/docker-saltstack/master.svg?style=for-the-badge)](https://travis-ci.org/warpnet/docker-saltstack)

# Readme
This readme describes the installation of required docker images for the SaltStack introduction at Warpnet.

# Docker compose
Before, it was required to manually build images (you still can), but we've since migrated to docker-compose.


## Building and starting
To get everything up and running, you can simply run the following:

```bash
docker-compose up --no-deps --build
```

## Accepting the minions
When the build and start finish, you'll need to log in to the master and accept the two minions:
```bash
docker exec -it docker-saltstack_saltmaster_1 /bin/bash
salt-key -A 
```

You'll get something like the following:

```console
The following keys are going to be accepted:
Unaccepted Keys:
8e16884eefa4
e71c41cb40f1
Proceed? [n/Y] y
Key for minion 8e16884eefa4 accepted.
Key for minion e71c41cb40f1 accepted.
```

## Testing the connection
Check if salt can ping the machines:

```bash
salt \* test.ping
e71c41cb40f1:
    True
8e16884eefa4:
    True
```

Now you're all ready to get started!
