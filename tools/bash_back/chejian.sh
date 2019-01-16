#!/bin/sh

### BEGIN INIT INFO
# Provides:	  chejian
# Required-Start:    $local_fs $remote_fs $network $syslog $named
# Required-Stop:     $local_fs $remote_fs $network $syslog $named
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the chejian server
# Description:       starts chejian using start-stop-daemon
### END INIT INFO

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
APP_PATH=/opt/vehicle/program/chejian/bin
DAEMON=/opt/vehicle/program/chejian/bin/CheJian
#NAME=CheJian
NAME=/opt/vehicle/program/chejian/bin/CheJian
DESC=chejian

STOP_SCHEDULE="${STOP_SCHEDULE:-QUIT/5/TERM/5/KILL/5}"

test -x $DAEMON || exit 0

. /lib/init/vars.sh
. /lib/lsb/init-functions

# Try to extract chejian pidfile
PID=/tmp/chejian.pid

if [ -n "$ULIMIT" ]; then
	# Set ulimit if it is set in /etc/default/chejian
	ulimit $ULIMIT
fi

start_chejian() {
	# Start the daemon/service
	#
	# Returns:
	#   0 if daemon has been started
	#   1 if daemon was already running
	#   2 if daemon could not be started
	cd $APP_PATH
	start-stop-daemon --start --quiet -m --background --chuid public:public --chdir $APP_PATH --pidfile $PID --exec $DAEMON --test > /dev/null \
		|| return 1
	start-stop-daemon --start --quiet -m --background --chuid public:public --chdir $APP_PATH --pidfile $PID --exec $DAEMON -- \
		$DAEMON_OPTS 2>/dev/null \
		|| return 2
}

test_config() {
	# Test the chejian configuration
	$DAEMON -t $DAEMON_OPTS >/dev/null 2>&1
}

stop_chejian() {
	# Stops the daemon/service
	#
	# Return
	#   0 if daemon has been stopped
	#   1 if daemon was already stopped
	#   2 if daemon could not be stopped
	#   other if a failure occurred
	#start-stop-daemon --stop --quiet --remove-pidfile --retry=$STOP_SCHEDULE --chuid public:public --chdir $APP_PATH --pidfile $PID --name $NAME
	#	RETVAL="$?"
	# stop
	kill -TERM `cat $PID`  
	RETVAL="$?"
	sleep 1
	return "$RETVAL"
}

reload_chejian() {
	# Function that sends a SIGHUP to the daemon/service
	start-stop-daemon --stop --signal HUP --quiet --chuid public:public --chdir $APP_PATH --pidfile $PID --name $NAME
	return 0
}

rotate_logs() {
	# Rotate log files
	start-stop-daemon --stop --signal USR1 --quiet --chuid public:public --pidfile $PID --name $NAME
	return 0
}

upgrade_chejian() {
	# Online upgrade chejian executable
	# http://chejian.org/en/docs/control.html
	#
	# Return
	#   0 if chejian has been successfully upgraded
	#   1 if chejian is not running
	#   2 if the pid files were not created on time
	#   3 if the old master could not be killed
	if start-stop-daemon --stop --signal USR2 --quiet --chuid public:public --chdir $APP_PATH --pidfile $PID --name $NAME; then
		# Wait for both old and new master to write their pid file
		while [ ! -s "${PID}.oldbin" ] || [ ! -s "${PID}" ]; do
			cnt=`expr $cnt + 1`
			if [ $cnt -gt 10 ]; then
				return 2
			fi
			sleep 1
		done
		# Everything is ready, gracefully stop the old master
		if start-stop-daemon --stop --signal QUIT --quiet --chuid public:public --chdir $APP_PATH --pidfile "${PID}.oldbin" --name $NAME; then
			return 0
		else
			return 3
		fi
	else
		return 1
	fi
}

case "$1" in
	start)
		log_daemon_msg "Starting $DESC" "$NAME"
		start_chejian
		case "$?" in
			0|1) log_end_msg 0 ;;
			2)   log_end_msg 1 ;;
		esac
		;;
	stop)
		log_daemon_msg "Stopping $DESC" "$NAME"
		stop_chejian
		case "$?" in
			0|1) log_end_msg 0 ;;
			2)   log_end_msg 1 ;;
		esac
		;;
	restart)
		log_daemon_msg "Restarting $DESC" "$NAME"

		# Check configuration before stopping chejian
		if ! test_config; then
			log_end_msg 1 # Configuration error
			exit $?
		fi

		stop_chejian
		case "$?" in
			0|1)
				start_chejian
				case "$?" in
					0) log_end_msg 0 ;;
					1) log_end_msg 1 ;; # Old process is still running
					*) log_end_msg 1 ;; # Failed to start
				esac
				;;
			*)
				# Failed to stop
				log_end_msg 1
				;;
		esac
		;;
	reload|force-reload)
		log_daemon_msg "Reloading $DESC configuration" "$NAME"

		# Check configuration before stopping chejian
		#
		# This is not entirely correct since the on-disk chejian binary
		# may differ from the in-memory one, but that's not common.
		# We prefer to check the configuration and return an error
		# to the administrator.
		if ! test_config; then
			log_end_msg 1 # Configuration error
			exit $?
		fi

		reload_chejian
		log_end_msg $?
		;;
	configtest|testconfig)
		log_daemon_msg "Testing $DESC configuration"
		test_config
		log_end_msg $?
		;;
	status)
		status_of_proc -p $PID "$DAEMON" "$NAME" && exit 0 || exit $?
		;;
	upgrade)
		log_daemon_msg "Upgrading binary" "$NAME"
		upgrade_chejian
		log_end_msg $?
		;;
	rotate)
		log_daemon_msg "Re-opening $DESC log files" "$NAME"
		rotate_logs
		log_end_msg $?
		;;
	*)
		echo "Usage: $NAME {start|stop|restart|reload|force-reload|status|configtest|rotate|upgrade}" >&2
		exit 3
		;;
esac

