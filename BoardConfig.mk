#
# Copyright (C) 2022 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/bangkk

# Inherit from motorola sm6375-common
include device/motorola/sm6375-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bangkk

# Fingerprint
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(DEVICE_PATH):libudfps_extension.bangkk
SOONG_CONFIG_qtidisplay_udfps := true

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.hab.product=bangkk
TARGET_KERNEL_CONFIG += vendor/bangkk_defconfig

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_KERNEL_MODULES_BLOCKLIST_FILE := $(DEVICE_PATH)/modules.blocklist
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)

# Partitions
BOARD_MOT_DP_GROUP_SIZE := 6706692096 # (BOARD_SUPER_PARTITION_SIZE - 4MB)
BOARD_SUPER_PARTITION_SIZE := 6710886400

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security patch level
VENDOR_SECURITY_PATCH := 2024-08-01

# inherit from the proprietary version
include vendor/motorola/bangkk/BoardConfigVendor.mk
