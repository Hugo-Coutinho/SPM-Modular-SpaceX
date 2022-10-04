// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpaceXPackage",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Core",
            targets: ["Core"]),
        .library(
            name: "Network",
            targets: ["Network"]),
        .library(
            name: "UIComponent",
            targets: ["UIComponent"]),
        .library(
            name: "Launch",
            targets: ["Launch"]),
        .library(
            name: "Company",
            targets: ["Company"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/kean/Nuke", from: "9.6.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Core",
            dependencies: []),
        .target(
            name: "Network",
            dependencies: []),
        .target(
            name: "UIComponent",
            dependencies: [
                "Core"
            ]),
        .target(
            name: "Launch",
            dependencies: [
                "Nuke",
                "UIComponent",
                "Network"
            ]),
        .target(
            name: "Company",
            dependencies: [
                "UIComponent",
                "Network"
            ]),
        .testTarget(
            name: "CoreTests",
            dependencies: [
                "Core"
            ])
    ]
)
