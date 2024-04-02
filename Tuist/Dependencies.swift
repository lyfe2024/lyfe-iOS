//
//  Dependencies.swift
//  ProjectDescriptionHelpers
//
//  Created by 박서연 on 2024/01/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/onevcat/Kingfisher.git",
                requirement: .upToNextMajor(from: "7.10.2")),
            .remote(url: "https://github.com/Alamofire/Alamofire.git",
                    requirement:.upToNextMajor(from: "5.8.1")),
            .remote(url: "https://github.com/Moya/Moya.git",
                    requirement: .upToNextMajor(from: "15.0.3")),
            .remote(url: "https://github.com/kakao/kakao-ios-sdk",
                    requirement: .upToNextMajor(from: "2.0.0"))
        ]
    ),

    platforms: [.iOS]
)

