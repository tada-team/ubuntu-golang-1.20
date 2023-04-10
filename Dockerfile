FROM docker.io/ubuntu:20.04

ENV GOPATH=/gocode
ENV PATH=$PATH:$GOPATH/bin

# golang
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apt-utils \
        software-properties-common \
	gcc \
        libc-dev \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        golang-1.20-go \
        golang-golang-x-tools \
    && apt-get autoremove -y \
    && apt-get remove -y \
        apt-utils \
        software-properties-common 
    

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
        td-janus=0.10.10-5 \
        td-libvips-dev=8.10.6-3 \
    && apt-get autoremove -y
