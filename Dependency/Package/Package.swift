// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "Package",
  platforms: [.iOS(.v17)],
  products: [
    .library(
      name: "ContainerDependency",
      targets: ["ContainerDependency"]
    ),
    .library(
      name: "ProtocolDependency",
      targets: ["ProtocolDependency"]
    ),
    .library(
      name: "SimpleDependency",
      targets: ["SimpleDependency"]
    ),
  ],
  targets: [
    .target(
      name: "ContainerDependency"
    ),
    .target(
      name: "ProtocolDependency"
    ),
    .target(
      name: "SimpleDependency"
    ),
  ]
)
