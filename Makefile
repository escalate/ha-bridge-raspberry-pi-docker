REPO_PREFIX = escalate4u/ha-bridge
TAG = latest

.PHONY: build
build:
	docker build \
		--tag=$(REPO_PREFIX)-raspberrypi3:$(TAG) \
		--build-arg DEVICE_NAME=raspberrypi3 \
		--build-arg HA_BRIDGE_VERSION=5.1.0 \
		.

.PHONY: publish
publish: build
	docker push $(REPO_PREFIX)-raspberrypi3:$(TAG)
