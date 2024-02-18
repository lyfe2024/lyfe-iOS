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
            .remote(
                url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.0"))
            
        ]
    ),
    platforms: [.iOS]
)

