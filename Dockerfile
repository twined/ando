FROM bitwalker/alpine-elixir-phoenix:latest

MAINTAINER Twined Networks <mail@twined.net>
ENV REFRESHED_AT 2017-02-23
ENV BUILD_APKS="curl wget bzip2 tar clang make gcc g++ python linux-headers paxctl binutils-gold autoconf bison zlib-dev openssl-dev"

WORKDIR /opt/app

RUN \
  apk update && \
  apk add git make gcc $BUILD_APKS && \
  npm install yarn
