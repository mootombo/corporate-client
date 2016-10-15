#!/bin/sh

### BEGIN INIT INFO
# Provides:		mcc-init
# Required-Start:	$local_fs $remote_fs $network $syslog $named $networking
# Required-Stop:	$local_fs $remote_fs $network $syslog $named $networking
# Should-Start:		mountnfs
# Should-Stop:
# Default-Start:	S
# Default-Stop:
# Short-Description:	Perform the moo-init script to execute things in cooperation with univention. Also check LDAP specific stuff.
### END INIT INFO

PATH="/sbin:/bin:/usr/sbin:/usr/bin"
NAME="mcc-init"
DESC="Perform the moo-init script"

# MOOTOMBO Corporate Library (MOOCL)
#. /var/lib/mootombo/library/moocl

# Possible to ovverride MOOCL with defaults
if [ -r "/etc/default/${NAME}" ]
then
	. "/etc/default/${NAME}"
fi

# Check if the preinstaller exist and kill 'em
if [ -r "/etc/init.d/*mcc-preinstaller.*" ]
then
	
fi

set -e

case "${1}" in
	start)
		echo "HARAKIRI"
		echo "Hihi DAS INBITSCRIPT IST JETZT DRAN !!!!!!!!!!!!!!!!!" >> /var/log/test.txt
		;;

	stop|restart|force-reload)

		;;

	*)
		echo "Usage: ${0} {start|stop|restart|force-reload}" >&2
		exit 1
		;;
esac

exit 0
