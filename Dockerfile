FROM ubuntu:24.04

# To Japanese
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales tzdata
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

# Use unminimize & Install default applications
RUN apt-get update && \
    apt-get install -y \
      unminimize sudo man-db \
      zsh tmux unzip curl wget git && \
    yes | unminimize && \
    apt-get -y autoremove && \
    apt-get clean

# Create user
ARG USERNAME
ARG GROUPNAME
ARG HOST_UID
ARG HOST_GID
RUN userdel ubuntu --force --remove
RUN groupadd ${GROUPNAME} --gid ${HOST_GID}
RUN useradd ${USERNAME} --uid ${HOST_UID} --gid ${HOST_GID} \
      --home-dir /home/${USERNAME} --shell /usr/bin/zsh
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/${USERNAME}
