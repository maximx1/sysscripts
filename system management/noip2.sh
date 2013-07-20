#!/bin/sh
#/etc/init.d/noip2.sh

# Supplied by no-ip.com
# Modified for Debian GNU/Linux by Eivind L. Rygge 
# corrected 1-17-2004 by Alex Docauer

# . /etc/rc.d/init.d/functions # uncomment/modify for your killproc

DAEMON=/usr/local/bin/noip2
NAME=noip2.sh

test -x $DAEMON || exit 0

case "$1" in
start)
echo -n "Starting dynamic address update: "
start-stop-daemon --start --exec $DAEMON
echo "noip2."
;;
stop)
echo -n "Shutting down dynamic address update:"
start-stop-daemon --stop --oknodo --retry 30 --exec $DAEMON
echo "noip2."
;;
restart)
echo -n "Restarting dynamic address update: "
start-stop-daemon --stop --oknodo --retry 30 --exec $DAEMON
start-stop-daemon --start --exec $DAEMON
echo "noip2."
;;
*)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac
exit 0
