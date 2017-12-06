#!/bin/sh
set -e

if [ -n "${WP_ENV}" ]; then
	if [ "${WP_ENV}" == "development" || "${WP_ENV}" == "dev" ]; then
		echo "Mapping host user to Docker user."

		# Setting Group Permissions
		echo "Changing the ID of www-data group to ${HOST_GID:-1000}"
		groupmod -o -g ${HOST_GID:-1000} www-data || true
		echo "Finished"
		echo "-- -- -- -- --"

		# Setting User Permissions
		echo "Changing the ID of www-data user to ${HOST_UID:-1000}"
		usermod -o -u ${HOST_UID:-1000} www-data || true
		echo "Finished"

	fi
fi

chown -R www-data:www-data /var/www/content

exec "$@"
