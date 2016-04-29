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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/ti/omap5uevm/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel \
	device/ti/omap5uevm/tablet_core_hardware_omap5uevm.xml:system/etc/permissions/tablet_core_hardware_omap5uevm.xml \
	device/ti/omap5uevm/init.omap5uevmboard.rc:root/init.omap5uevmboard.rc \
	device/ti/omap5uevm/init.omap5uevmboard.usb.rc:root/init.omap5uevmboard.usb.rc \
	device/ti/omap5uevm/ueventd.omap5uevmboard.rc:root/ueventd.omap5uevmboard.rc \
	device/ti/omap5uevm/fstab.omap5uevmboard:root/fstab.omap5uevmboard \
	device/ti/omap5uevm/media_profiles.xml:system/etc/media_profiles.xml \
	device/ti/omap5uevm/media_codecs.xml:system/etc/media_codecs.xml \
	device/ti/omap5uevm/bootanimation.zip:/system/media/bootanimation.zip \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	device/ti/omap5uevm/Atmel_maXTouch_Touchscreen.idc:system/usr/idc/Atmel_maXTouch_Touchscreen.idc \
	device/ti/omap5uevm/LDC_3001_TouchScreen_Controller.idc:system/usr/idc/LDC_3001_TouchScreen_Controller.idc \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \

PRODUCT_PACKAGES := \
	e2fsck

PRODUCT_PROPERTY_OVERRIDES := \
	hwui.render_dirty_regions=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
	device/ti/omap5uevm/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

# WI-Fi
PRODUCT_PACKAGES += \
	hostapd.conf \
	wifical.sh \
	TQS_D_1.7.ini \
	TQS_D_1.7_127x.ini \
	crda \
	regulatory.bin \
	wlconf

PRODUCT_PACKAGES += \
	LegacyCamera \
	camera_test \
	ion_tiler_test \
	iontest \
	ion_ti_test2 \
	vpetest \
	libdrm

# Audio HAL modules
PRODUCT_PACKAGES += audio.primary.omap5
PRODUCT_PACKAGES += audio.hdmi.omap5
# BlueDroid a2dp Audio HAL module
PRODUCT_PACKAGES += audio.a2dp.default
# Remote submix
PRODUCT_PACKAGES += audio.r_submix.default

# Audio policy
PRODUCT_PACKAGES += audio_policy.omap5

PRODUCT_PACKAGES += \
	audio_policy.conf \
	mixer_paths.xml

PRODUCT_PACKAGES += \
	tinymix \
	tinyplay \
	tinycap

# Radio
PRODUCT_PACKAGES += \
	HelloRadio \
	lad_dra7xx \
	libtiipc \
	libtiipcutils

# Can utilities
PRODUCT_PACKAGES += \
	libcan \
	bcmserver \
	canbusload \
	can-calc-bit-timing \
	candump \
	canfdtest \
	cangen \
	cangw \
	canlogserver \
	canplayer \
	cansend \
	cansniffer \
	isotpdump \
	isotprecv \
	isotpsend \
	isotpserver \
	isotpsniffer.c \
	isotptun \
	log2asc \
	log2long \
	slcan_attach \
	slcand \
	slcanpty \

# Enable AAC 5.1 decode (decoder)
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

# Multi-zone audio (requires OMAP_MULTIZONE_AUDIO, see BoardConfig.mk)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.ti.omap_multizone_audio=true

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/ti/dra7xx/omap5.mk)
$(call inherit-product-if-exists, hardware/ti/wpan/ti-wpan-products.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/omap5/ti-omap5-vendor.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/omap5/ducati-full_omap5uevm.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/wl12xx/wlan/wl12xx-wlan-fw-products.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/wl12xx/wpan/wl12xx-wpan-fw-products.mk)
