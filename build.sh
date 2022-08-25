#!/bin/bash

docker buildx build --platform=linux/amd64,linux/arm64 -t inngest/bun --push .
docker buildx build --platform=linux/amd64,linux/arm64 -t inngest/bun:$VERSION --push .
