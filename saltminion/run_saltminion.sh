#!/bin/bash

#
# Salt-Minion Run Script
#

set -e

# Log Level
LOG_LEVEL=${LOG_LEVEL:-"error"}

# Copy hostname to minion ID
cat /etc/hostname > /etc/salt/minion_id

# Run Salt as a Deamon
exec sudo /usr/bin/salt-minion --log-level=$LOG_LEVEL
