#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    vendor/lib*/vendor.lge.hardware.nfc@1.0.so|vendor/lib*/vendor.lge.hardware.nfc@1.1.so)
        sed -i "s/libhidltransport\.so/libhidlbase_shim\.so/g" "${2}"
        ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=l01k
export DEVICE_COMMON=joan-common
export VENDOR=lge
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
