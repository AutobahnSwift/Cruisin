// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Cruisin",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", .branch("nio")),

        .package(url: "https://github.com/vapor/leaf.git", .branch("nio")),
//        .package(url: "https://github.com/AutobahnSwift/Shuttle.git", .branch("master")),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "Leaf"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

