#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL mako devices, and
# are also specific to mako devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/xiaomi/mione_plus/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES := \
	lights.msm8660

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

PRODUCT_COPY_FILES += $(shell test -d device/xiaomi/mione_plus/prebuilt/modules &&  \
	find device/xiaomi/mione_plus/prebuilt/modules -name '*.ko' \
	-printf '%p:system/lib/modules/%f ')

PRODUCT_COPY_FILES += \
	device/xiaomi/mione_plus/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
	device/xiaomi/mione_plus/nvram.txt:system/etc/wifi/nvram.txt \
	device/xiaomi/mione_plus/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/xiaomi/mione_plus/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	device/xiaomi/mione_plus/thermald-mione.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
	device/xiaomi/mione_plus/ramdisk/init.qcom.rc:root/init.qcom.rc \
	device/xiaomi/mione_plus/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
	device/xiaomi/mione_plus/ramdisk/init.rc:root/init.rc \
	device/xiaomi/mione_plus/ramdisk/init.target.rc:root/init.target.rc \
	device/xiaomi/mione_plus/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
	device/xiaomi/mione_plus/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
	device/xiaomi/mione_plus/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
	device/xiaomi/mione_plus/ramdisk/init.qcom.sh:root/init.qcom.sh \
	device/xiaomi/mione_plus/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
	device/xiaomi/mione_plus/fstab.qcom:root/fstab.qcom \
	device/xiaomi/mione_plus/media_profiles.xml:system/etc/media_profiles.xml \
	device/xiaomi/mione_plus/media_codecs.xml:system/etc/media_codecs.xml

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/xiaomi/mione_plus/keylayout/8660_handset.kl:system/usr/keylayout/8660_handset.kl \
	device/xiaomi/mione_plus/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/xiaomi/mione_plus/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
	device/xiaomi/mione_plus/keylayout/ffa-keypad.kl:system/usr/keylayout/ffa-keypad.kl \
	device/xiaomi/mione_plus/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
	device/xiaomi/mione_plus/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
	device/xiaomi/mione_plus/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/xiaomi/mione_plus/keylayout/Virtual.kcm:system/usr/keychars/Virtual.kcm \
	device/xiaomi/mione_plus/keylayout/Generic.kcm:system/usr/keychars/Generic.kcm

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# GPS configuration
PRODUCT_COPY_FILES += \
	device/xiaomi/mione_plus/gps.conf:system/etc/gps.conf

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic=dmic \
	persist.audio.fluence.mode=endfire \
	persist.audio.lowlatency.rec=false \
	af.resampler.quality=4


# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=0

#Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += debug.mdpcomp.maxlayer=3

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8660 \
	gralloc.msm8660 \
	copybit.msm8660

PRODUCT_PACKAGES += \
	alsa.msm8660 \
	audio_policy.msm8660 \
	audio.primary.msm8660 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

PRODUCT_PACKAGES += \
	hci_qcomm_init

PRODUCT_PACKAGES += \
	power.msm8660

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
	camera.mione_plus \
	camera.msm8660 \
	libmmcamera_interface2 \
	libmmcamera_interface

PRODUCT_PACKAGES += \
	mm-vdec-omx-test \
	mm-venc-omx-test720p \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libstagefrighthw \
	libc2dcolorconvert

PRODUCT_PACKAGES += \
	libloc_adapter \
	libloc_eng \
	libloc_api_v02 \
	libgps.utils \
	gps.msm8660

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	debug.prerotation.disable=1

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
