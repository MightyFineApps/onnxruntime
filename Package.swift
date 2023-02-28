// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "onnxruntime",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "onnxruntime",
                 type: .static,
                 targets: ["OnnxWrapper"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "OnnxWrapper",
                dependencies: ["onnxruntime"],
                path: "swift/objcOnnxWrapper",
                cxxSettings: [
                    .unsafeFlags(["-std=c++17",
                                  "-fobjc-arc-exceptions"
                                 ]),
                ], linkerSettings: [
                    .unsafeFlags(["-ObjC"]),
                ]),

        // to generate checksum use `shasum -a 256 path/tp/my/zip` or `swift package compute-checksum path/tp/my/zip`
        .binaryTarget(name: "onnxruntime",
                      url: "https://onnxruntimepackages.z14.web.core.windows.net/pod-archive-onnxruntime-mobile-c-1.14.0.zip",
                      checksum: "adceeb7a1c7bf434c3086d706c43bdcfcf356d53768b6e41ebad9e3fac9c3251"),

        .testTarget(name: "onnxTests",
                    dependencies: ["OnnxWrapper"],
                    path: "swift/onnxTests"),
    ]
)
