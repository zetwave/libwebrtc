include ../../VERSION

BASE_DIR := $(CURDIR)/../..

include ../env.mk

TARGET_OS ?= macos
TARGET_CPU ?= x86_64

include ../common.mk

.PHONY: all
all: clean build package

.PHONY: package
package: common-package

.PHONY: copy
copy: common-copy

.PHONY: patch
patch: common-patch

.PHONY: build
build: patch
	cd $(SRC_DIR) && \
	gn gen $(BUILD_DIR) --args='$(CC_WRAPPER) \
	target_os="mac" \
	mac_deployment_target="10.12.0" \
	is_debug=false \
	treat_warnings_as_errors=false \
	$(RTC_USE_H264) \
	proprietary_codecs=true \
	use_custom_libcxx=false \
	use_system_libjpeg=true \
	system_libjpeg_root="$(EXT_LIB_DIR)/qt_5_15_1/qtbase/src/3rdparty/libjpeg" \
	use_xcode_clang=true \
	enable_iterator_debugging=false \
	enable_dsyms=true \
	rtc_build_ssl=false \
	rtc_include_tests=false \
	rtc_build_examples=false \
	rtc_build_tools=false \
	rtc_ssl_root="$(EXT_LIB_DIR)/openssl_1_1_1/include" \
	rtc_ssl_libs=["$(EXT_LIB_DIR)/openssl_1_1_1/libssl.a","$(EXT_LIB_DIR)/openssl_1_1_1/libcrypto.a"] \
	rtc_builtin_ssl_root_certificates=true \
	rtc_include_tests=false \
	rtc_build_examples=false \
	is_component_build=false \
	use_rtti=true \
	rtc_enable_protobuf=false' && \
	ninja -C $(BUILD_DIR) && \
	ninja -C $(BUILD_DIR) \
	  builtin_audio_decoder_factory \
	  default_task_queue_factory \
	  native_api \
	  default_codec_factory_objc \
	  peerconnection \
	  videocapture_objc
