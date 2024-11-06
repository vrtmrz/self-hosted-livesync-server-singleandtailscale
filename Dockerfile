FROM couchdb:3.4.2
# Copy Tailscale binaries from the tailscale image on Docker Hub.
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscaled /app/tailscaled
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscale /app/tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale
VOLUME [ "/opt/couchdb/data" ]

COPY init.sh /init.sh
COPY docker-entrypoint2.sh /docker-entrypoint2.sh
COPY local.ini /opt/couchdb/etc/local.ini

ENTRYPOINT  ["tini", "--", "/docker-entrypoint2.sh"]
CMD ["/opt/couchdb/bin/couchdb"]