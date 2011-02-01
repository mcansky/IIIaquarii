#!/bin/sh
# vim:set et sts=4 ts=4 tw=80:
echo "================================================="
echo "== Started: `date`"
echo "================================================="
cd /home/git/aq3
rake sshkeys:export
mv /tmp/authorized_keys /home/git/.ssh/
chown git /home/git/.ssh/authorized_keys
chmod 600 /home/git/.ssh/authorized_keys
rake git:pull
echo "================================================="
echo "== Ended: `date`"
echo "================================================="
echo
