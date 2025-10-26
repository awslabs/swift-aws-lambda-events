// swift-tools-version:6.0

import PackageDescription

let swiftSettings: [SwiftSetting] = [.enableExperimentalFeature("StrictConcurrency=complete")]

let package = Package(
    name: "swift-aws-lambda-events",
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
        ),
        .testTarget(
            name: "AWSLambdaEventsTests",
            dependencies: [
                "AWSLambdaEvents"
            ],
            swiftSettings: swiftSettings
        ),
    ]
)
