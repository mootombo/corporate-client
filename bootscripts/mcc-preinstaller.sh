#!/bin/sh

### BEGIN INIT INFO
# Provides:			mcc-preinstaller
# Required-Start:	$local_fs $remote_fs $network $syslog $named $networking
# Required-Stop:	$local_fs $remote_fs $network $syslog $named $networking
# Should-Start:
# Should-Stop:
# Default-Start:	S
# Default-Stop:
# Short-Description:	Start the mcc-preinstaller
### END INIT INFO

PATH="/sbin:/bin:/usr/sbin:/usr/bin"
NAME="mcc-preinstaller"
DESC="Start the mcc-preinstaller"

# MOOTOMBO Corporate Script Library (MOOCSL)
. /usr/lib/mootombo-corporate-client/library/moocsl

# Possible to ovverride MOOCSL with defaults
if [ -r "/etc/default/${NAME}" ]
then
	. "/etc/default/${NAME}"
fi

set -e

case "${1}" in
	start)
		echo "HARAKIRI"
		echo "Hihi der installer hat zugeschlöagen" >> /var/log/test.txt
		;;

	stop|restart|force-reload)

		;;

	*)
		echo "Usage: ${0} {start|stop|restart|force-reload}" >&2
		exit 1
		;;
esac

exit 0
