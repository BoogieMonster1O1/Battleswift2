// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Battleswift",
  products: [
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
      from: "2.0.0"),
    .package(
      url: "https://github.com/BoogieMonster1O1/SwiftTUI",
      branch: "main"),
  ],
  targets: [
    .target(
      name: "Battleswift",
      dependencies: [
        .product(name: "BinaryCodable", package: "BinaryCodable")
      ]),
    .executableTarget(
      name: "BattleswiftCli",
      dependencies: [
        "Battleswift",
        .product(name: "SwiftTUI", package: "SwiftTUI")
      ]
    ),
    .testTarget(
      name: "BattleswiftTests",
      dependencies: ["Battleswift"])
  ]
)
