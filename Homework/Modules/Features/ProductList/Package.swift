// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProductList",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "ProductList", targets: ["ProductList"])
    ],
    dependencies: [
        .package(path: "../../Common"),
        .package(path: "../../Core"),
        .package(path: "../../Shared")
    ],
    targets: [
        .target(name: "ProductListData",
                dependencies: [
                    .target(name: "ProductListDomain")
                ],
                path: "Sources/Data",
                resources: [.process("Resources")]),
        .target(name: "ProductListDomain",
                dependencies: [
                    .product(name: "Common", package: "Common"),
                    .product(name: "Core", package: "Core"),
                    .product(name: "Shared", package: "Shared")
                ],
                path: "Sources/Domain"),
        .target(name: "ProductListPresentation",
                dependencies: [
                    .target(name: "ProductListDomain")
                ],
                path: "Sources/Presentation"),
        .target(name: "ProductList",
                dependencies: [
                    .target(name: "ProductListData"),
                    .target(name: "ProductListDomain"),
                    .target(name: "ProductListPresentation")
                ]),
        .testTarget(name: "ProductListTests",
                    dependencies: ["ProductList"])
    ]
)
