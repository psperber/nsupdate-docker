#!/bin/sh

set -e

echo "${CRON_INTERVAL} /opt/nsupdate/nsupdate.sh" > /var/spool/cron/crontabs/root

touch /var/log/nsupdate.log

crond

exec "$@"
