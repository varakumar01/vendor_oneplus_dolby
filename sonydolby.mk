#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from the proprietary version
$(call inherit-product, vendor/sony/dolby/dolby-vendor.mk)

DOLBY_PATH := vendor/sony/dolby

# Configs: dax-default-<device>.xml when the device has its own speaker tuning
DOLBY_DAX_XML := $(firstword $(wildcard $(DOLBY_PATH)/configs/dolby/dax-default-$(patsubst lineage_%,%,$(TARGET_PRODUCT)).xml) \
    $(DOLBY_PATH)/configs/dolby/dax-default.xml)

PRODUCT_COPY_FILES += \
    $(DOLBY_DAX_XML):$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    $(DOLBY_PATH)/configs/dolby/dax-default-spatializer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default-spatializer.xml

# Dolby
PRODUCT_PACKAGES += \
   LunarisDolby

# Overlay-RRO
PRODUCT_PACKAGES += \
    SonyDolbyResCommon

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DOLBY_PATH)/sepolicy/vendor

# Properties
TARGET_VENDOR_PROP += $(DOLBY_PATH)/vendor.prop

# VINTF
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DOLBY_PATH)/configs/hidl/dolby_framework_matrix.xml
