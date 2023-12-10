FROM certbot/certbot:v2.8.0

ARG script="/usr/local/bin/acmedns-certbot.py"
ARG url="https://raw.githubusercontent.com/mikavl/acme-dns-certbot-joohoi/kubernetes/acme-dns-auth.py"

COPY --chown=root:root certbot.sh /usr/local/bin/certbot.sh

RUN wget -qO "$script" "$url" \
 && chmod 0755 "$script" /usr/local/bin/certbot.sh

CMD /usr/local/bin/certbot.sh
ENTRYPOINT []
