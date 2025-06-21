// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "Core", targets: ["Networking", "UIComponents"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.0")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "8.0.0"))
    ],
    targets: [
        .target(name: "Networking",
                dependencies: [.product(name: "Alamofire", package: "Alamofire")]),
        .target(name: "UIComponents",
                dependencies: [.product(name: "Kingfisher", package: "Kingfisher")])
    ]
)
