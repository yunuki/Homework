// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "Shared",targets: ["DesignSystem", "DI", "Utils"])
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(name: "DesignSystem"),
        .target(name: "DI",
                dependencies: [.product(name: "Swinject", package: "Swinject")]),
        .target(name: "Utils")
    ]
)
