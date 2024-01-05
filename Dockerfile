ARG DEVICE_NAME

FROM resin/${DEVICE_NAME}-openjdk:latest

LABEL maintainer="Felix Boerner <ich@felix-boerner.de>"

ARG HA_BRIDGE_VERSION

WORKDIR /ha-bridge

# hadolint ignore=DL3059
RUN [ "cross-build-start" ]

RUN curl \
    --silent \
    --fail \
    --retry 3 \
    --location \
    --output ha-bridge.jar \
    https://github.com/bwssytems/ha-bridge/releases/download/v${HA_BRIDGE_VERSION}/ha-bridge-${HA_BRIDGE_VERSION}.jar

RUN [ "cross-build-end" ]

COPY /docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
