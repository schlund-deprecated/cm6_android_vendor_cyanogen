# Inherit AOSP device configuration for photon.
$(call inherit-product, device/htc/photon/photon.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_photon
PRODUCT_BRAND := htc
PRODUCT_DEVICE := photon
PRODUCT_MODEL := photon
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_photon BUILD_ID=FRG83 BUILD_DISPLAY_ID=FRG83 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2.1 FRG83 60505 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/cyanogen/prelink-linux-arm-photon.map

TARGET_USERIMAGES_USE_EXT2 := true
CYANOGEN_WITH_GOOGLE := true

PRODUCT_PACKAGES += FM


ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-Photon
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6.2.0-RC0-Photon
endif

#
# Copy photon specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip