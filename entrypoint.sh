if [[ -n "${SHOPWARE_CONFIG}" ]]; then
  echo "Overriding Config"
  echo '${SHOPWARE_CONFIG}' | envsubst > /shopware/config.php
fi

/usr/bin/supervisord -c /etc/supervisord.conf
