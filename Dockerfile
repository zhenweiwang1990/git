# Base
FROM ubuntu:14.04

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/' /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y \
  wget \
  build-essential \
  automake \
  openssh-client \
  zlib1g-dev \
  gettext \
  libreadline-dev \
  libssl-dev

RUN wget -qO- https://github.com/git/git/archive/v2.5.0.tar.gz | tar xvz -C git-2.5.0

RUN cd git-2.5.0 && autoconf && ./configure --without-tcltk && make && make install && ln -s /usr/local/bin/git /usr/bin/git
