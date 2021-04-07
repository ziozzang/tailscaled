#!/bin/bash

#!/bin/bash
CONT_NAME=tailscaled
IMAGE_NAME=ziozzang/tailscaled
docker rm -f ${CONT_NAME}  || true
# mount persistance - /var/lib/tailscale
docker run \
	--restart=always \
	-d --name=${CONT_NAME} \
	-v /var/lib:/var/lib \
	-v /dev/net/tun:/dev/net/tun \
       	--network=host \
	--privileged \
	--log-driver json-file --log-opt max-size=10m \
	${IMAGE_NAME} tailscaled

sleep 5

docker exec ${CONT_NAME} tailscale up
