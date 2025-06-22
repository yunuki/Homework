// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Common",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "Common", targets: ["Entity", "UI"])
    ],
    dependencies: [
        .package(path: "../Shared"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.0.0"))
    ],
    targets: [
        .target(name: "Entity"),
        .target(name: "UI",
                dependencies: [
                    .product(name: "Kingfisher", package: "Kingfisher"),
                    .product(name: "Shared", package: "Shared")
                ])
    ]
)
