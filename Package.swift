// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WolfWith",
    platforms: [
        .iOS(.v9), .macOS(.v10_13), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "WolfWith",
            type: .dynamic,
            targets: ["WolfWith"]),
        ],
    targets: [
        .target(
            name: "WolfWith",
            dependencies: [])
        ]
)
