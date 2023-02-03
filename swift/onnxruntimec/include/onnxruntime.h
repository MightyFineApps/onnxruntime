// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#if defined(__clang__)
#pragma clang diagnostic push
// ignore clang documentation-related warnings
// instead, we will rely on Doxygen warnings for the C/C++ API headers
#pragma clang diagnostic ignored "-Wdocumentation"
#endif  // defined(__clang__)

#include "onnxruntime/onnxruntime_c_api.h"
//#include "onnxruntime/onnxruntime_cxx_api.h"
#include "onnxruntime/cpu_provider_factory.h"
//#include "onnxruntime/onnxruntime_cxx_inline.h"

#if __has_include("onnxruntime/coreml_provider_factory.h")
#define ORT_OBJC_API_COREML_EP_AVAILABLE 1
#else
#define ORT_OBJC_API_COREML_EP_AVAILABLE 0
#endif

#if ORT_OBJC_API_COREML_EP_AVAILABLE
#include "onnxruntime/coreml_provider_factory.h"
#endif

#if defined(__clang__)
#pragma clang diagnostic pop
#endif  // defined(__clang__)
