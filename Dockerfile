FROM ubuntu:18.04

ENV GOPATH=/gocode
ENV PATH=$PATH:$GOPATH/bin

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apt-utils \
        curl \
        ffmpeg \
        gnupg \
        libreoffice-writer \
        software-properties-common \
        tzdata \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        golang-1.16-go \
        golang-go \
        golang-golang-x-tools \
    && apt-get remove -y \
        apt-utils \
        software-properties-common
