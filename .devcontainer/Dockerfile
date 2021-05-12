FROM debian:buster

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y --no-install-recommends sudo ca-certificates pkg-config gnupg wget bzip2 xz-utils bsdtar make entr git && \
    apt-get clean

RUN wget https://github.com/devkitPro/pacman/releases/download/v1.0.2/devkitpro-pacman.amd64.deb && \
    apt install -y ./devkitpro-pacman.amd64.deb && \
    rm devkitpro-pacman.amd64.deb

RUN dkp-pacman -Syyu --noconfirm gba-dev && \
    dkp-pacman -Scc --noconfirm

ENV DEVKITPRO=/opt/devkitpro
ENV PATH=${DEVKITPRO}/tools/bin:$PATH
ENV DEVKITARM=${DEVKITPRO}/devkitARM
