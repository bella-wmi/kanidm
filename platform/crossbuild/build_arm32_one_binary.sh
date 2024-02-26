#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 target_os"
    if [ -d ./platform ]; then
        echo "Options:"
        find platform/crossbuild -type d -maxdepth 1 -mindepth 1 | awk -F'/' '{print $NF}' | sort
    fi
    exit 1
fi

if [ ! -d "platform/crossbuild/$1" ]; then
    echo "Could not find platform/crossbuild/$1"
    exit 1
fi

TARGET_DIR="./target/arm32_one_binary"
 
echo "Recreating then building to ${TARGET_DIR}"
rm -rf "${TARGET_DIR}"
mkdir -p "${TARGET_DIR}"

CROSS_CONFIG="platform/crossbuild/arm32/Cross.toml" \
    cross build --target arm-unknown-linux-gnueabihf --bin kanidmd --release 


find "./target/arm-unknown-linux-gnueabihf/release/" -maxdepth 1 \
    -type f -not -name '*.d' \
    -name 'kanidm*' \
    -exec mv "{}" "${TARGET_DIR}/" \;

find "./target/arm-unknown-linux-gnueabihf/release/" -maxdepth 1 \
    -name '*kanidm*.so' \
    -exec mv "{}" "${TARGET_DIR}/" \;
# find "${TARGET_DIR}" -name '*.d' -delete

echo "Contents of ${TARGET_DIR}"
find "${TARGET_DIR}" -type f
