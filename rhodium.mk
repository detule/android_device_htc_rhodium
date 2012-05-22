#
# Copyright (C) 2009 The Android Open Source Project
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

$(call inherit-product-if-exists, vendor/htc/rhodium/device_rhodium-vendor.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/rhodium/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

DEVICE_PACKAGE_OVERLAYS += device/htc/rhodium/overlay

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500

PRODUCT_COPY_FILES += \
    device/htc/rhodium/prebuilt/init.rhodium.rc:root/init.rhodium.rc \
    device/htc/rhodium/prebuilt/pppd_runner:system/bin/pppd_runner \
    device/htc/rhodium/prebuilt/ueventd.rhodium.rc:root/ueventd.rhodium.rc

# Permissions for HeroC
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Add the Device Configuration files for touchscreen and cursor (trackball) devices
PRODUCT_COPY_FILES += \
    device/htc/rhodium/prebuilt/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/rhodium/prebuilt/tssc-manager.idc:system/usr/idc/tssc-manager.idc \
    device/htc/rhodium/prebuilt/rhodium-nav.idc:system/usr/idc/rhodium-nav.idc

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/rhodium/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/rhodium/prebuilt/rhodium-keypad.kl:system/usr/keylayout/rhodium-keypad.kl \
    device/htc/rhodium/prebuilt/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

PRODUCT_COPY_FILES += \
    device/htc/rhodium/prebuilt/vold.fstab:system/etc/vold.fstab \
    device/htc/rhodium/prebuilt/gps.conf:system/etc/gps.conf \
    device/htc/rhodium/prebuilt/apns-conf.xml:system/etc/apns-conf.xml

PRODUCT_COPY_FILES += \
    device/htc/rhodium/prebuilt/libcamera.so:obj/lib/libcamera.so \
    device/htc/rhodium/prebuilt/libcamera.so:system/lib/libcamera.so \
    device/htc/rhodium/prebuilt/wlan.ko:system/lib/modules/wlan.ko


# Product Packages
PRODUCT_PACKAGES += \
    librs_jni \
    sensors.rhodium \
    lights.rhodium \
    lights.msm7k \
    audio.a2dp.default \
    audio.primary.rhodium \
    audio_policy.rhodium \
    gralloc.rhodium \
    gps.rhodium \
    camera.msm7k \
    wlan_loader \
    tiwlan.ini \
    dhcpcd.conf \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    com.android.future.usb.accessory

# USB mass storage
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

# HeroC uses mdpi artwork where available
PRODUCT_LOCALES += mdpi

# Install HeroC kernel modules
$(call inherit-product, device/htc/rhodium/rhodium-modules.mk)

PRODUCT_NAME := generic_rhodium
PRODUCT_DEVICE := rhodium
PRODUCT_BRAND := Android
PRODUCT_MODEL := Android on Rhodium
