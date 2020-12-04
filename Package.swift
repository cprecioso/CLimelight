// swift-tools-version:5.3

import PackageDescription

let ignoreWindows = CSetting.define("__ENET_WIN32_H__")

let package = Package(
  name: "CLimelight",
  products: [
    .library(
      name: "CLimelight",
      targets: ["CLimelight"])
  ],
  dependencies: [
    .package(url: "https://github.com/Kitura/OpenSSL.git", from: "2.2.2")
  ],
  targets: [
    .target(
      name: "enet",
      cSettings: [ignoreWindows]
    ),
    .target(
      name: "rs",
      publicHeadersPath: "."),
    .target(
      name: "CLimelight",
      dependencies: ["enet", "rs", "OpenSSL"],
      publicHeadersPath: ".",
      cSettings: [ignoreWindows]),
  ]
)
