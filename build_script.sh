#!/bin/bash

export PATH=/home/dstorer/SP800-90B_EntropyAssessment/gcc-arm-10.2-2020.11-x86_64-aarch64-none-elf/bin:$PATH
rm -rf none-elf-build/
mkdir none-elf-build
mkdir ../../picolibc_build
meson setup none-elf-build \
    --cross-file scripts/cross-aarch64-none-elf.txt \
    --prefix=${PWD}/../../picolibc_build \
    -Dnewlib-global-errno=true \
    -Dnewlib-reent-small=true \
    -Dnewlib-io-long-long=false 
ninja -C none-elf-build
ninja -C none-elf-build install
