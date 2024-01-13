[![Test](https://github.com/escalate/ha-bridge-raspberry-pi-docker/actions/workflows/test.yml/badge.svg?branch=master&event=push)](https://github.com/escalate/ha-bridge-raspberry-pi-docker/actions/workflows/test.yml)

# ha-bridge-raspberry-pi-docker

Automated build of ha-bridge Docker images specialized for Raspberry Pi devices.

## How to run container

The following example explains how to run the latest version of ha-bridge Docker container on Raspberry Pi 3.
```
docker run \
      --name ha-bridge \
      --rm \
      --init \
      --detach \
      --net=host \
      --volume=$PWD:/ha-bridge/data \
      --volume=/etc/localtime:/etc/localtime:ro \
      --volume=/etc/timezone:/etc/timezone:ro \
      habridge/ha-bridge-raspberrypi3
```

To set additional arguments for ha-bridge just write them as arguments for docker run command.
```
docker run \
      --name ha-bridge \
      --rm \
      --init \
      --detach \
      --detach \
      --net=host \
      --volume=$PWD:/ha-bridge/data \
      --volume=/etc/localtime:/etc/localtime:ro \
      --volume=/etc/timezone:/etc/timezone:ro \
      habridge/ha-bridge-raspberrypi3 \
      -Dserver.port=8080 \
      -Dsecurity.key=secret
```

## Docker Hub Repos

* [habridge/ha-bridge-raspberry-pi](https://hub.docker.com/r/habridge/ha-bridge-raspberry-pi)
* [habridge/ha-bridge-raspberry-pi2](https://hub.docker.com/r/habridge/ha-bridge-raspberry-pi2)
* [habridge/ha-bridge-raspberrypi3](https://hub.docker.com/r/habridge/ha-bridge-raspberrypi3)

## License

MIT
