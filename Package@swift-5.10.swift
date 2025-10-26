// swift-tools-version:5.10

import PackageDescription

let swiftSettings: [SwiftSetting] = [.enableExperimentalFeature("StrictConcurrency=complete")]

let package = Package(
    name: "swift-aws-lambda-events",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "AWSLambdaEvents", targets: ["AWSLambdaEvents"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-http-types.git", from: "1.5.1")
    ],
    targets: [
        .target(
            name: "AWSLambdaEvents",
            dependencies: [
                .product(name: "HTTPTypes", package: "swift-http-types")
            ],
            swiftSettings: swiftSettings
        )
    ]
)
