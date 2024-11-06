#!/bin/bash
# Set up Data Directories
export ERL_FLAGS=-couch_ini /opt/couchdb/etc/default.ini /opt/couchdb/etc/default.d/ /opt/couchdb/etc/local.d /opt/couchdb/etc/local.ini
touch /opt/couchdb/data/persistence.ini
chmod +w /opt/couchdb/data/persistence.ini
mkdir -p /opt/couchdb/data/tailscale
# TailScale
echo "Starting TailScale"
/app/tailscaled -tun=userspace-networking --statedir=/opt/couchdb/data/tailscale &
/app/tailscale up --authkey=${TS_AUTHKEY} ${TS_EXTRA_ARGS} --hostname=${TS_HOSTNAME}
/app/tailscale funnel --bg http://localhost:5984

echo "Starting CouchDB"
