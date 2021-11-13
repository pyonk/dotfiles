FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get install -y \
    gcc \
    curl \
    git \
    tmux \
    zsh \
    sudo \
    software-properties-common

RUN curl -sfLS install-node.now.sh/lts | bash -s -- --yes

RUN add-apt-repository ppa:neovim-ppa/stable
RUN apt-get update \
    && apt-get install -y \
    neovim

ENV USER pyonk
ENV HOME /home/$USER
RUN useradd -m $USER
RUN gpasswd -a $USER sudo
RUN chsh -s /bin/zsh

WORKDIR $HOME

RUN curl -L https://raw.githubusercontent.com/pyonk/dotfiles/master/install.sh | bash
