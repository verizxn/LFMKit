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
        .package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.10.2")),
        .package(url: "https://github.com/onmyway133/SwiftHash", .upToNextMajor(from: "2.0.2"))
    ],
    targets: [
        .target(
            name: "LFMKit",
            dependencies: ["Alamofire", "SwiftHash"]
        ),
    ]
)
