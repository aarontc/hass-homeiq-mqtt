#!/usr/bin/with-contenv bashio


DEVICE_PATH=$(bashio::config 'xbee_device')
export DEVICE_PATH

if bashio::services.available 'mqtt'; then
	mqtt_host=$(bashio::services 'mqtt' 'host')
	mqtt_password=$(bashio::services 'mqtt' 'password')
	mqtt_port=$(bashio::services 'mqtt' 'port')
	mqtt_ssl=$(bashio::services 'mqtt' 'ssl')
	mqtt_username=$(bashio::services 'mqtt' 'username')
	if [[ "${mqtt_ssl}" == 'false' ]]; then
		mqtt_protocol="mqtt"
	else
		mqtt_protocol="mqtts"
	fi
else
	bashio::exit.nok 'Missing MQTT service'
fi

MQTT_URI="${mqtt_protocol}://${mqtt_username}:${mqtt_password}@${mqtt_host}:${mqtt_port}"
export MQTT_URI

exec bundle exec exe/mqtt_xbee

