FROM mcr.microsoft.com/devcontainers/rust:1-1-bookworm as base

# Adjust the following args to the username and groupname of the base image
ARG BASE_IMAGE_USERNAME="vscode"
ARG BASE_IMAGE_GROUP="${BASE_IMAGE_USERNAME}"
ARG HOME=/home/${BASE_IMAGE_USERNAME}

# Overwriteable from outside via build-args
ARG USER_UID=1000
ARG USER_GID=1000

# Change uid and gid of base image user
RUN groupmod -g ${USER_GID} ${BASE_IMAGE_GROUP}
RUN usermod -u ${USER_UID} -g ${USER_GID} ${BASE_IMAGE_USERNAME}
RUN chown ${USER_UID}:${USER_GID} ${HOME} -R

#Set rust version to 1.70
RUN rustup default 1.70

# Install apt dependencies
RUN apt-get update \
    && apt-get install -y \
    libc-dev \
    libssl-dev \
    libudev-dev \
    libpam0g-dev \
    gcc \
    gcc-arm-linux-gnueabihf \
    binutils-arm-linux-gnueabihf \
    gcc-aarch64-linux-gnu \
    binutils-aarch64-linux-gnu \
    && apt-get clean