#!/bin/bash
set -e

if [[ "${WEBPROXY_ENABLED}" = "true" ]]; then

  /etc/init.d/tinyproxy stop

fi
