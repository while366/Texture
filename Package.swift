// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let headersSearchPath: [CSetting] = [.headerSearchPath("."),
                                     .headerSearchPath("Base"),
                                     .headerSearchPath("Debug"),
                                     .headerSearchPath("Details"),
                                     .headerSearchPath("Details/Transactions"),
                                     .headerSearchPath("Layout"),
                                     .headerSearchPath("Private"),
                                     .headerSearchPath("Private/Layout"),
                                     .headerSearchPath("TextExperiment/Component"),
                                     .headerSearchPath("TextExperiment/String"),
                                     .headerSearchPath("TextExperiment/Utility"),
                                     .headerSearchPath("TextKit"),
                                     .headerSearchPath("tvOS"),]

let sharedDefines: [CSetting] = [
                                // Disable "old" textnode by default for SPM
                                .define("AS_USE_VIDEO", to: "1"),
    
                                // PINRemoteImage always available for Texture
                                .define("AS_PIN_REMOTE_IMAGE", to: "1"),
                                
                                // always disabled
                                .define("IG_LIST_COLLECTION_VIEW", to: "0"),]

let package = Package(
    name: "Texture",
    platforms: [
             .macOS(.v10_15),
             .iOS(.v10),
             .tvOS(.v10)
         ],
    products: [
        .library(
            name: "AsyncDisplayKit",
            type: .static,
            targets: ["AsyncDisplayKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pinterest/PINRemoteImage.git", .upToNextMajor(from: "3.0.3"))
    ],
    targets: [
        .target(
            name: "AsyncDisplayKit",
            dependencies: ["PINRemoteImage"],
            path: "Source",
            cSettings: headersSearchPath + sharedDefines
        ),
    ],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)
