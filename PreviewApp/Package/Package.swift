// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "Package",
  platforms: [
    .iOS(.v26),
  ],
  products: [
    .library(
      name: "AppFeature",
      targets: ["AppFeature"]
    ),
    .library(
      name: "DatabaseClient",
      targets: ["DatabaseClient"]
    ),
    .library(
      name: "DatabaseClientLive",
      targets: ["DatabaseClientLive"]
    ),
    .library(
      name: "HomeFeature",
      targets: ["HomeFeature"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.23.1"),
    .package(url: "https://github.com/pointfreeco/sqlite-data", from: "1.4.2"),
  ],
  targets: [
    .target(
      name: "AppFeature",
      dependencies: [
        "DatabaseClient",
        "FeatureKit",
        "HomeFeature",
      ]
    ),
    .target(
      name: "DatabaseClient",
      dependencies: [
        "FeatureKit",
      ]
    ),
    .target(
      name: "DatabaseClientLive",
      dependencies: [
        "DatabaseClient",
        .product(name: "SQLiteData", package: "sqlite-data")
      ]
    ),
    .target(
      name: "FeatureKit",
      dependencies: [
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
      ]
    ),
    .target(
      name: "HomeFeature",
      dependencies: [
        "DatabaseClient",
        "FeatureKit",
      ]
    )
  ]
)
