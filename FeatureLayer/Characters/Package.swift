// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Characters",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Characters",
            targets: ["Characters"]),
    ],
    dependencies: [
        .package(path: "../CommonLogic"),
        .package(
              url: "https://github.com/pointfreeco/swift-composable-architecture",
              from: "1.0.0"
            )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Characters",
            dependencies: [
                .product(name: "CommonLogic", package: "CommonLogic"),
                .product(
                          name: "ComposableArchitecture",
                          package: "swift-composable-architecture"
                        )
            ]
        ),
        .testTarget(
            name: "CharactersTests",
            dependencies: ["Characters"]),
    ]
)
