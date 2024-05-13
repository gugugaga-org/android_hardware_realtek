# RELEASE NAME: 20230424_BT_ANDROID_13.0
# RTKBT_API_VERSION=2.1.1.0

CUR_PATH := hardware/realtek/rtkbt

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_RTK := true
BOARD_HAVE_BLUETOOTH_RTK_TV := false

#ifeq ($(BOARD_HAVE_BLUETOOTH_RTK_TV), true)
#Firmware For Tv
#include $(LOCAL_PATH)/Firmware/TV/TV_Firmware.mk
#else
#Firmware For Tablet
#include $(LOCAL_PATH)/Firmware/BT/BT_Firmware.mk
#endif

#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

PRODUCT_COPY_FILES += $(CUR_PATH)/vendor/etc/bluetooth/rtkbt.conf:vendor/etc/bluetooth/rtkbt.conf
       $(CUR_PATH)/system/etc/permissions/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
       $(CUR_PATH)/system/etc/permissions/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \

ifeq ($(BOARD_HAVE_BLUETOOTH_RTK_TV), true)
PRODUCT_COPY_FILES += $(CUR_PATH)/vendor/usr/keylayout/Vendor_005d_Product_0001.kl:vendor/usr/keylayout/Vendor_005d_Product_0001.kl
PRODUCT_COPY_FILES += $(CUR_PATH)/vendor/usr/keylayout/Vendor_005d_Product_0002.kl:vendor/usr/keylayout/Vendor_005d_Product_0002.kl
PRODUCT_COPY_FILES += $(CUR_PATH)/frameworks/native/data/etc/android.hardware.bluetooth_le.xml:vendor/etc/permissions/android.hardware.bluetooth_le.xml
PRODUCT_COPY_FILES += $(CUR_PATH)/frameworks/native/data/etc/android.hardware.bluetooth.xml:vendor/etc/permissions/android.hardware.bluetooth.xml
endif

ifeq ($(TARGET_BOARD_PLATFORM),rk3288)
PRODUCT_COPY_FILES += \
    $(CUR_PATH)/Firmware/BT/rtl8723bs_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8723bs_config \
    $(CUR_PATH)/Firmware/BT/rtl8723bs_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8723bs_fw \
    $(CUR_PATH)/Firmware/BT/rtl8723ds_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8723ds_config \
    $(CUR_PATH)/Firmware/BT/rtl8723ds_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8723ds_fw
else
PRODUCT_COPY_FILES += \
    $(CUR_PATH)/Firmware/BT/rtl8822b_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8822b_config \
    $(CUR_PATH)/Firmware/BT/rtl8822b_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8822b_fw \
    $(CUR_PATH)/Firmware/BT/rtl8822c_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8822c_config \
    $(CUR_PATH)/Firmware/BT/rtl8822c_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8822c_fw  \
    $(CUR_PATH)/Firmware/BT/rtl8852bu_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8852bu_config \
    $(CUR_PATH)/Firmware/BT/rtl8852bu_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl8852bu_fw
endif

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1-service \
    libbt-vendor-realtek \


PRODUCT_PROPERTY_OVERRIDES += \
                    persist.vendor.bluetooth.rtkcoex=true \
                    persist.vendor.rtkbt.bdaddr_path=none \
                    persist.vendor.bluetooth.prefferedrole=master \
                    persist.vendor.rtkbtadvdisable=false \

PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.profile.a2dp.sink.enabled=false \
    bluetooth.profile.a2dp.source.enabled=true \
    bluetooth.profile.avrcp.controller.enabled=false \
    bluetooth.profile.avrcp.target.enabled=true \
    bluetooth.profile.bap.broadcast.assist.enabled=false \
    bluetooth.profile.bap.broadcast.source.enabled=false \
    bluetooth.profile.bap.unicast.client.enabled=false \
    bluetooth.profile.bass.client.enabled=false \
    bluetooth.profile.csip.set_coordinator.enabled=false \
    bluetooth.profile.gatt.enabled=true \
    bluetooth.profile.hfp.ag.enabled=true \
    bluetooth.profile.hfp.hf.enabled=false \
    bluetooth.profile.hid.device.enabled=true \
    bluetooth.profile.hid.host.enabled=true \
    bluetooth.profile.map.client.enabled=false \
    bluetooth.profile.map.server.enabled=true \
    bluetooth.profile.opp.enabled=true \
    bluetooth.profile.pan.nap.enabled=false \
    bluetooth.profile.pan.panu.enabled=false \
    bluetooth.profile.pbap.client.enabled=false \
    bluetooth.profile.pbap.server.enabled=false \
    bluetooth.profile.sap.server.enabled=false \
#   bluetooth.profile.asha.central.enabled=false \
    bluetooth.profile.bas.client.enabled=true \
    bluetooth.profile.ccp.server.enabled=true \
    bluetooth.profile.hap.client.enabled=true \
    bluetooth.profile.mcp.server.enabled=true \
    bluetooth.profile.vcp.controller.enabled=true


PRODUCT_SYSTEM_DEFAULT_PROPERTIES += persist.bluetooth.btsnooplogmode=disable \
                    persist.bluetooth.btsnooppath=/data/misc/bluetooth/logs/btsnoop_hci.log \
                    persist.bluetooth.btsnoopsize=0xfffff \
                    persist.bluetooth.showdeviceswithoutnames=false \
                    vendor.bluetooth.enable_timeout_ms=11000 \
                    vendor.realtek.bluetooth.en=false
