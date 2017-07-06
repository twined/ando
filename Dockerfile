FROM bitwalker/alpine-elixir:latest

MAINTAINER Twined Networks <mail@twined.net>
ENV REFRESHED_AT 2017-07-06
ENV BUILD_APKS="git inotify-tools nodejs nodejs-npm curl wget bzip2 tar clang make gcc g++ python linux-headers paxctl binutils-gold autoconf bison zlib-dev openssl-dev"

# Install NPM
RUN \
    mkdir -p /opt/app && \
    chmod -R 777 /opt/app && \
    apk update && \
    apk --no-cache --update add $BUILD_APKS && \
    npm install npm -g --no-progress && \
    npm install yarn -g --no-progress && \
    update-ca-certificates --fresh && \
    rm -rf /var/cache/apk/*

# Add local node module binaries to PATH
ENV PATH=./node_modules/.bin:$PATH \
    HOME=/opt/app

# Install Hex+Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /opt/app
