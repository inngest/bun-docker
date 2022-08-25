ARG BUN_VERSION=v0.1.10

# FROM --platform=$TARGETPLATFORM debian:stable-slim as get
FROM --platform=$TARGETPLATFORM debian:stable-slim AS get
ARG TARGETPLATFORM
ARG BUN_VERSION

# Thanks to https://github.com/BretFisher/multi-platform-docker-build && tini.
WORKDIR /tmp/
RUN apt-get update && apt-get install -y wget unzip
RUN case ${TARGETPLATFORM} in \
         "linux/amd64")  BUN_ARCH=x64     ;; \
         "linux/arm64")  BUN_ARCH=aarch64 ;; \
    esac \
 && wget -q https://github.com/oven-sh/bun/releases/download/bun-${BUN_VERSION}/bun-linux-${BUN_ARCH}.zip \
 && unzip bun-linux-${BUN_ARCH}.zip && mv ./bun-linux-${BUN_ARCH}/bun /tmp/bun

FROM --platform=$TARGETPLATFORM debian:stable-slim
ARG TARGETPLATFORM
COPY --from=get /tmp/bun /usr/local/bin
