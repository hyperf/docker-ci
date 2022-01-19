ARG DOCKER_VERSION=latest
FROM docker:${DOCKER_VERSION}

LABEL maintainer="Hyperf Developers <group@hyperf.io>" version="1.0" license="MIT"

ARG COMPOSE_VERSION
ARG DOCKER_VERSION

RUN apk add --no-cache py3-pip python3 git
RUN apk add --no-cache --virtual \
  build-dependencies \
  cargo \
  gcc \
  libc-dev \
  libffi-dev \
  make \
  openssl-dev \
  python3-dev \
  rust \
  && pip3 install "docker-compose${COMPOSE_VERSION:+==}${COMPOSE_VERSION}" \
  && apk del build-dependencies
