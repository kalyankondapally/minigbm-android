# Copyright (C) 2016 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

SUBDIRS := \
	cros_gralloc

LOCAL_SHARED_LIBRARIES := \
	libdrm \
	liblog \
	libcutils \
	libhardware_legacy \
	libutils \
	libdrm_intel


LOCAL_C_INCLUDES := \
	external/libdrm \
	external/libdrm/include/drm \

LOCAL_SRC_FILES := \
        cirrus.c \
	drv.c \
        evdi.c \
	gbm.c \
	gbm_helpers.c \
	helpers.c \
	i915.c \
        virtio_gpu.c \
        vgem.c \
        udl.c \
        gma500.c \
	cros_gralloc/cros_alloc_device.cc \
	cros_gralloc/cros_gralloc_helpers.cpp \
	cros_gralloc/cros_gralloc_module.cpp

LOCAL_CPPFLAGS += -std=c++11 -DDRV_I915 -D_FILE_OFFSET_BITS=64
LOCAL_CFLAGS += -Wall -Wsign-compare -Wpointer-arith \
		-Wcast-qual -Wcast-align \
		-isystem external/drm_hwcomposer \
		-DDRV_I915 -D_FILE_OFFSET_BITS=64

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include

LOCAL_MODULE := gralloc.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := $(TARGET_SHLIB_SUFFIX)
include $(BUILD_SHARED_LIBRARY)
