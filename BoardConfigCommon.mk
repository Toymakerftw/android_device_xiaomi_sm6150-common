#
# Copyright (C) 2020-2024 The LineageOS Project
# Copyright (C) 2024 Paranoid Android
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

BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

BOARD_VENDOR := xiaomi

COMMON_PATH := device/xiaomi/sm6150-common

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Inherit from proprietary files
include vendor/xiaomi/sm6150-common/BoardConfigVendor.mk

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# Audio
AUDIO_FEATURE_ENABLED_EXTENDED_COMPRESS_FORMAT := true

BOARD_SUPPORTS_OPENSOURCE_STHAL := true
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sm6150
TARGET_NO_BOOTLOADER := true

# GPS
LOC_HIDL_VERSION := 4.0

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/qcom/opensource/core-utils/vendor_framework_compatibility_matrix.xml \
    $(COMMON_PATH)/configs/hidl/xiaomi_framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE := $(COMMON_PATH)/configs/hidl/manifest.xml
DEVICE_MANIFEST_FILE += hardware/qcom/media/conf_files/sm6150/c2_manifest.xml
ODM_MANIFEST_FILES += $(COMMON_PATH)/configs/hidl/manifest-qva.xml

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true

TARGET_KERNEL_SOURCE := kernel/xiaomi/sm6150
TARGET_KERNEL_CONFIG := vendor/sdmsteppe-perf_defconfig

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x880000
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += loop.max_part=7

# Enable DTB in bootimage and set header version
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS := --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Media
TARGET_DISABLED_UBWC := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT ?= -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE ?= 94371840
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT ?= -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE ?= 94371840

BOARD_USES_METADATA_PARTITION := true

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Power
TARGET_POWER_FEATURE_EXT_LIB := //$(COMMON_PATH):libpowerfeature_ext_xiaomi_sm6150

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/init/recovery.fstab
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_xiaomi
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# Sepolicy
TARGET_SEPOLICY_DIR := msmsteppe

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# WiFi
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
