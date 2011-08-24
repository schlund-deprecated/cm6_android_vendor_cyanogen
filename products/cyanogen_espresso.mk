# Inherit AOSP device configuration for espresso.
$(call inherit-product, device/htc/espresso/espresso.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_espresso
PRODUCT_BRAND := tmobile
PRODUCT_DEVICE := espresso
PRODUCT_MODEL := T-Mobile myTouch 3G Slide
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRG83 BUILD_DISPLAY_ID=FRG83 PRODUCT_NAME=htc_espresso BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2.1 FRG83 60505 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-espresso.map

# Extra Espresso overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/espresso

# Include the Torch app
PRODUCT_PACKAGES += Torch

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-Slide
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6.2.0-RC0-Slide
endif

#
# Copy espresso specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
