#!/bin/bash

set -e -E -u -C -o pipefail

exec /usr/bin/java "$@" -jar /ha-bridge/ha-bridge.jar
