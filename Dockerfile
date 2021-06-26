FROM ubuntu:18.04

ENV GOPATH=/gocode
ENV PATH=$PATH:$GOPATH/bin

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apt-utils \
        curl \
        ffmpeg \
        gnupg \
        libavcodec-extra \
        libmp3lame-dev \
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
        
RUN go get \
        github.com/axw/gocov/gocov \
        github.com/jstemmer/go-junit-report \
        github.com/matm/gocov-html \
        github.com/ory/go-acc \
        github.com/t-yuki/gocover-cobertura \
        github.com/go-delve/delve/cmd/dlv
