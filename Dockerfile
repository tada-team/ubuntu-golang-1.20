FROM ubuntu:18.04

ENV GOPATH=/gocode
ENV PATH=$PATH:$GOPATH/bin

# golang
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apt-utils \
        software-properties-common \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        golang-1.16-go \
        golang-go \
        golang-golang-x-tools \
    && apt-get autoremove -y \
    && apt-get remove -y \
        apt-utils \
        software-properties-common \
    && go get \
        github.com/axw/gocov/gocov \
        github.com/dave/courtney \
        github.com/jstemmer/go-junit-report \
        github.com/matm/gocov-html \
        github.com/ory/go-acc \
        github.com/t-yuki/gocover-cobertura \
        github.com/go-delve/delve/cmd/dlv

# tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ffmpeg \
    libavcodec-extra \
    libmp3lame-dev \
    libreoffice-writer \
    tzdata

# td-libs
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        curl \
        gnupg \
    && curl -s --compressed https://tada-team.github.io/ppa/KEY.gpg | apt-key add - \
    && curl -s --compressed -o /etc/apt/sources.list.d/td-debs.list https://tada-team.github.io/ppa/td-debs.list \
    && apt-get remove -y \
        curl \
        gnupg \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        td-janus=0.10.10-3 \
        td-libnice-dev=0.1.16-2 \
        td-libsrtp-dev=2.3.0-2 \
        td-libvips-dev=8.10.5-4 \
        td-libwebsockets-dev=3.2.2-1 \
    && apt-get autoremove -y
