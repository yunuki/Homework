// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductDetail",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "ProductDetail", targets: ["ProductDetail"])
    ],
    dependencies: [
        .package(path: "../../Core"),
        .package(path: "../../Shared")
    ],
    targets: [
        .target(name: "ProductDetailData",
                dependencies: [
                    .target(name: "ProductDetailDomain")
                ],
                path: "Sources/Data"),
        .target(name: "ProductDetailDomain",
                dependencies: [
                    .product(name: "Core", package: "Core"),
                    .product(name: "Shared", package: "Shared")
                ],
                path: "Sources/Domain"),
        .target(name: "ProductDetailPresentation",
                dependencies: [
                    .target(name: "ProductDetailDomain")
                ],
                path: "Sources/Presentation"),
        .target(name: "ProductDetail",
                dependencies: [
                    .target(name: "ProductDetailData"),
                    .target(name: "ProductDetailDomain"),
                    .target(name: "ProductDetailPresentation")
                ])
    ]
)
