// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "FazeKit",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "FazeKit",
            targets: ["FazeKit"]),
    ],
    targets: [
        .target(
            name: "FazeKit"),
        .testTarget(
            name: "FazeKitTests",
            dependencies: ["FazeKit"]),
    ]
)
