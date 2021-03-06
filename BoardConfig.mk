# Copyright (C) 2007 The Android Open Source Project
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

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true

# Fake building with eclair cam
BOARD_USES_ECLAIR_LIBCAMERA := true

-include vendor/htc/rhodium/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := msm7k
TARGET_BOARD_PLATFORM_GPU := qcom

TARGET_GRALLOC_USES_ASHMEM := true
TARGET_FORCE_CPU_UPLOAD := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOOTLOADER_BOARD_NAME := rhodium
TARGET_OTA_ASSERT_DEVICE := rhodium
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BOOTLOADER_BOARD_NAME=rhodium

# ARMv6-compatible processor rev 5 (v6l)
TARGET_CPU_ABI := armeabi-v6j
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6j

TARGET_SPECIFIC_HEADER_PATH := device/htc/rhodium/include

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := libWifiApi
BOARD_WLAN_TI_STA_DK_ROOT   := system/wlan/ti/sta_dk_4_0_4_32
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_ARG      := ""
WIFI_DRIVER_MODULE_NAME     := "wlan"
WIFI_FIRMWARE_LOADER        := "wlan_loader"

BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x19200000

BOARD_USES_GENERIC_AUDIO := false
#ICS BOARD_USES_AUDIO_LEGACY := true

BOARD_HAVE_BLUETOOTH := true

BOARD_VENDOR_USE_AKMD := akm8973

BOARD_VENDOR_QCOM_AMSS_VERSION := 4410

#JB BOARD_USES_QCOM_HARDWARE := true
#JB BOARD_USES_QCOM_LIBS := true

TARGET_HARDWARE_3D := false

# OpenGL drivers config file path
BOARD_EGL_CFG := device/htc/rhodium/egl.cfg

BOARD_USE_HTC_LIBSENSORS := true
BOARD_USE_RHODIUM_LIBSENSORS := true

# use old sensors HAL
# TARGET_USES_OLD_LIBSENSORS_HAL := true

BUILD_LIBCAMERA := true
BOARD_CAMERA_LIBRARIES := libcameraservice libcamera
USE_CAMERA_STUB:= false

BOARD_USES_GPSSHIM := true
BOARD_GPS_NEEDS_XTRA := true

BOARD_NO_RGBX_8888 := true

WITH_DEXPREOPT := false

JS_ENGINE := v8

# Stagefright fully enabled
BUILD_WITH_FULL_STAGEFRIGHT := true

# No fallback font by default (space savings)
# NO_FALLBACK_FONT:=true

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common

# # cat /proc/mtd
# nand tag: n=0 name=recovery offset=0x4000000 size=0x5c0000 flags=0x0
# nand tag: n=1 name=misc offset=0x45c0000 size=0x100000 flags=0x0
# nand tag: n=2 name=boot offset=0x46c0000 size=0x400000 flags=0x0
# nand tag: n=3 name=system offset=0x4ac0000 size=0xc000000 flags=0x0
# nand tag: n=4 name=userdata offset=0x10ac0000 size=0xe4e0000 flags=0x0
# nand tag: n=5 name=cache offset=0x1efa0000 size=0x1060000 flags=0x0

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x5c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xc000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0xe4e0000

# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

#TARGET_RECOVERY_UI_LIB := librecovery_ui_heroc librecovery_ui_htc
TARGET_PREBUILT_KERNEL := device/htc/rhodium/prebuilt/kernel

# ICS 
COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12 -DMISSING_GRALLOC_BUFFERS
#BOARD_USE_LEGACY_TOUCHSCREEN := true
BOARD_USE_LEGACY_TRACKPAD := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
#USB mass storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file
