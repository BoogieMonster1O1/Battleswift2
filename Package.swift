// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Battleswift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Battleswift",
            targets: ["Battleswift"]),
        .executable(
            name: "BattleswiftCli",
            targets: ["BattleswiftCli"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/christophhagen/BinaryCodable", 
           from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Battleswift",
            dependencies: [
                .product(name: "BinaryCodable", package: "BinaryCodable")
            ]),
        .executableTarget(
            name: "BattleswiftCli"),
        .testTarget(
            name: "BattleswiftTests",
            dependencies: ["Battleswift"]),
    ]
)
