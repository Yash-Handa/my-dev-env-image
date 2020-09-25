# syntax = docker/dockerfile:1.0-experimental

# This Docker file has my devlopment configs
FROM ubuntu:20.04 AS base

LABEL author "Yash Handa <yashhanda7@yahoo.com>"
LABEL description "My dev Environment"

# Add all extra dependencies, make it a full blown Ununtu server
COPY ./unminimize /usr/local/sbin/
RUN unminimize

# install the following dependencies (as root)
RUN apt-get update \
	&& apt-get -y install \
	manpages=5.05-1 \
	man-db=2.9.1-1 \
	neovim=0.4.3-3 \
	nano=4.8-1ubuntu1 \
	less=551-1ubuntu0.1 \
	curl=7.68.0-1ubuntu2.2 \
	git=1:2.25.1-1ubuntu3

FROM base AS home

# install Golang v1.15.2 (installing it first because Root is required)
RUN curl -o ./go1.15.2.linux-amd64.tar.gz -L https://golang.org/dl/go1.15.2.linux-amd64.tar.gz \
	&& tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz \
	&& rm -rf go1.15.2.linux-amd64.tar.gz

ARG USER=yash_dev
ARG UID=1000

RUN adduser --shell /bin/bash --uid ${UID} ${USER}
WORKDIR /home/${USER}
COPY ./home .
RUN chown -R ${USER}:${USER} .
USER ${UID}:${UID}

# Install NVM (node version manager), node.js and nvm (node v12.18.4, npm v6.14.6)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash \
	&& export NVM_DIR="$HOME/.nvm" \
	&& [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
	&& [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
	&& nvm install 12.18.4 \
	&& nvm use node

# Install and config vim-plug
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
       && vim +'PlugInstall --sync' +qa

# Adding some dependencies
#RUN go get -v github.com/Yash-Handa/logo-ls \
	#	&& npm install -g tldr

CMD ["/bin/bash"]

