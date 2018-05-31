LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := Terminal
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := Terminal

zterm_root  := $(LOCAL_PATH)
zterm_dir   := term
zterm_out   := $(PWD)/$(OUT_DIR)/target/common/obj/APPS/$(LOCAL_MODULE)_intermediates
zterm_build := $(zterm_root)/$(zterm_dir)/build
zterm_apk   := build/outputs/apk/$(zterm_dir)-release-unsigned.apk

$(zterm_root)/$(zterm_dir)/$(zterm_apk):
	rm -rf $(zterm_build)
	mkdir -p $(zterm_build)/outputs/apk
	mkdir -p $(zterm_out)
	ln -sf $(zterm_out) $(zterm_build)
	cd $(zterm_root)/$(zterm_dir) && gradle assembleRelease

LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SRC_FILES := $(zterm_dir)/$(zterm_apk)
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

include $(BUILD_PREBUILT)