# FROM ubuntu:22.04
# ARG DEBIAN_FRONTEND=noninteractive

# RUN apt-get update && apt-get install --assume-yes --no-install-recommends \
#     gcc-arm-linux-gnueabihf \
#     libssl-dev \
#     libc6-dev-armhf-cross

# ENV CROSS_TOOLCHAIN_PREFIX=arm-linux-gnueabihf-
# ENV CARGO_TARGET_ARM_UNKNOWN_LINUX_GNU_LINKER="$CROSS_TOOLCHAIN_PREFIX"gcc \
#     AR_arm_unknown_linux_gnu="$CROSS_TOOLCHAIN_PREFIX"ar \
#     CC_arm_unknown_linux_gnu="$CROSS_TOOLCHAIN_PREFIX"gcc \
#     CXX_arm_unknown_linux_gnu="$CROSS_TOOLCHAIN_PREFIX"g++ \
#     RUST_TEST_THREADS=1 \
#     PKG_CONFIG_PATH="/usr/lib/arm-unknown-linux-gnueabihf/pkgconfig/:${PKG_CONFIG_PATH}"

FROM rust:1.70 

RUN apt update && apt upgrade -y 
RUN apt install -y g++-arm-linux-gnueabihf libc6-dev-armhf-cross

RUN rustup target add arm-unknown-linux-gnueabihf 
RUN rustup toolchain install stable-arm-unknown-linux-gnueabihf 

WORKDIR /app 

ENV CARGO_TARGET_ARM_UNKOWN_LINUX_GNUEABIHF_LINKER=arm-linux-gnueabihf-gcc CC_arm-unknown-linux-gnueabihf=arm-linux-gnueabihf-gcc CXX_arm-unknown-linux-gnueabihf=arm-linux-gnueabihf-g++
