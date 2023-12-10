#!/bin/sh
set -e
set -u

if [ ! -d "/etc/letsencrypt/live" ]; then
  exec certbot certonly -n --agree-tos --register-unsafely-without-email \
    --manual --manual-auth-hook /usr/local/bin/acmedns-certbot.py \
    --preferred-challenges dns $ACMEDNS_CERTBOT_DOMAINS
else
  exec certbot renew -n
fi
