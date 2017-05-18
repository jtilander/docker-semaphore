#!/bin/bash
set -e

case "$1" in 
	semaphore)
		shift

		# Wait for mysql to come up
		while ! curl -s ${MYSQL_ADDR}:3306 > /dev/null ; do
			echo "Waiting for MYSQL to come up on ${MYSQL_ADDR}:3306 ..."
			sleep 2
		done
		echo "MYSQL at ${MYSQL_ADDR}:3306 is up and running."


		if [ ! -f /data/.setup_done ]; then
			echo "Configuring semaphore for the first time..."

			/usr/bin/semaphore -setup <<EOL
${MYSQL_ADDR}:3306
root
password
semaphore
/data
${MY_URL}
n
n
n
yes
${ADMIN_USER}
${ADMIN_EMAIL}
Admin
${ADMIN_PASSWORD}
EOL

			touch /data/.setup_done
		fi

 		exec /usr/bin/semaphore -config /data/semaphore_config.json
		;;

	wait)
		shift
		echo "Just waiting a while..."
		sleep 10000
		;;
esac

exec "$@"
