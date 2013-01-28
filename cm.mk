## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/xiaomi/mione_plus/full_mione_plus.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mione_plus
PRODUCT_NAME := cm_mione_plus
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := NMI-ONE Plus
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mione_plus BUILD_FINGERPRINT=Xiaomi/mione_plus/mione_plus:4.1.2/JZO54K/QDS81:userdebug/test-keys PRIVATE_BUILD_DESC="mione_plus-userdebug 4.1.2 JZO54K QDS81 test-keys"

# Enable Torch
PRODUCT_PACKAGES += Torch
