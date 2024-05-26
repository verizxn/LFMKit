// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LFMKit",
    products: [
        .library(
            name: "LFMKit",
            targets: ["LFMKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.9.1")),
        .package(url: "https://github.com/verizxn/SwiftMD5", branch: "master")
    ],
    targets: [
        .target(
            name: "LFMKit",
            dependencies: ["Alamofire", "SwiftMD5"]
        ),
        .testTarget(
            name: "LFMKitTests",
            dependencies: ["LFMKit"]),
    ]
)
