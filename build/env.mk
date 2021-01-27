USE_CCACHE ?= 1
USE_H264 ?= 0
USE_X11 ?= 0

SUB_DIR_OPTS = USE_CCACHE=$(USE_CCACHE) USE_H264=$(USE_H264) USE_X11=$(USE_X11)

WEBRTC_DIR ?= $(BASE_DIR)/webrtc
SRC_DIR ?= $(WEBRTC_DIR)/src
BUILD_DIR ?= $(BASE_DIR)/webrtc_build
THIRD_PARTY_DIR ?= $(WEBRTC_DIR)/third_party
CCACHE ?= $(THIRD_PARTY_DIR)/ccache
DEPOT_TOOLS_DIR ?= $(THIRD_PARTY_DIR)/depot_tools
PATCH_DIR ?= $(BASE_DIR)/patch
SCRIPTS_DIR ?= $(BASE_DIR)/scripts
CONFIG_DIR ?= $(BASE_DIR)/config
PACKAGE_DIR ?= $(BASE_DIR)/package
EXT_LIB_DIR := $(realpath ../../..)

export PATH := $(DEPOT_TOOLS_DIR):$(PATH)
export TAR_OPTIONS := --no-same-owner
