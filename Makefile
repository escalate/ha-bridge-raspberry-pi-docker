NAMESPACE = habridge
APPLICATION_NAME = ha-bridge
DEVICE_NAME ?= raspberrypi3
IMAGE_NAME = $(NAMESPACE)/$(APPLICATION_NAME)-$(DEVICE_NAME)
APPLICATION_VERSION = $(shell curl --silent --fail --retry 3 --location --header 'Accept: application/json' https://api.github.com/repos/bwssytems/ha-bridge/releases/latest | jq -r '.tag_name' | sed 's/^v//g')

.PHONY: build
build:
	docker build \
		--tag=$(IMAGE_NAME):build \
		--build-arg=DEVICE_NAME=$(DEVICE_NAME) \
		--build-arg=HA_BRIDGE_VERSION=$(APPLICATION_VERSION) \
		.

.PHONY: publish
publish: build
	docker tag $(IMAGE_NAME):build $(IMAGE_NAME):$(APPLICATION_VERSION)
	docker tag $(IMAGE_NAME):build $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(APPLICATION_VERSION)
	docker push $(IMAGE_NAME):latest
