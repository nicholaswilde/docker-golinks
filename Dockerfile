FROM golang:1.16.5-alpine3.14 as build
ARG VERSION
ARG COMMIT
ENV GO111MODULE on
WORKDIR /go/src/github.com/prologic/golinks
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN \
  echo "**** install packages ****" && \
  apk add --no-cache \
    git=2.32.0-r0 \
    make=4.3-r0 \
    build-base=0.5-r2 && \
  echo "**** download golinks ****" && \
  mkdir /app && \
  git clone "https://github.com/prologic/golinks.git" /go/src/github.com/prologic/golinks && \
  git reset --hard "${COMMIT}" && \
  make TAG=${VERSION} BUILD=dev build

FROM ghcr.io/linuxserver/baseimage-alpine:3.14
ARG BUILD_DATE
ARG VERSION
# hadolint ignore=DL3048
LABEL build_version="Version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="nicholaswilde"
COPY --from=build --chown=abc:abc /go/src/github.com/prologic/golinks/golinks /app/golinks
COPY root/ /
RUN \
  mkdir /data && \
  chown -R abc:abc /data
EXPOSE 8000/tcp
VOLUME \
  /app \
  /data
