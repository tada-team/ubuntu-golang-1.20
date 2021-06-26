FROM ubuntu:18.04

ENV GOPATH=/gocode
ENV PATH=$PATH:$GOPATH/bin

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apt-utils \
    curl \
    gnupg \
    software-properties-common \
    tzdata

RUN add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        golang-1.16-go \
        golang-go \
        golang-golang-x-tools \
    && apt-get remove -y \
        apt-utils \
        curl \
        gnupg \
        software-properties-common \
    && apt-get clean -y \
    && rm -rf \
        /tmp/* \
        /var/lib/apt/lists/*
