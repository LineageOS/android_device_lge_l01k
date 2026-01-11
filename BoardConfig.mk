#
# Copyright (C) 2018-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lge/l01k

TARGET_OTA_ASSERT_DEVICE := L-01K,joan,l01k

# inherit from common repository
include device/lge/joan-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG := lineageos_l01k_defconfig

# Partition
BOARD_SUPER_PARTITION_SIZE := 5863636992
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 5859442688 # (BOARD_SUPER_PARTITION_SIZE - 4194304) 4MiB overhead

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# inherit from the proprietary version
include vendor/lge/l01k/BoardConfigVendor.mk
