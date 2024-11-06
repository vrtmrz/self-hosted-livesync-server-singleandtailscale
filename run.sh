#!/bin/bash
#Run the container for testing
export instance=v_$RANDOM
docker build -t $instance . && docker run --rm --init -it --env-file .env -v ${PWD}/data:/opt/couchdb/data $instance
