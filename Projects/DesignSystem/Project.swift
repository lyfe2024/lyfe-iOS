//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박서연 on 2024/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let designSystemTarget = Target.makeTarget(
    name: "DesignSystem",
    platform: .iOS,
    product: .framework,
    organizationName: "iOSteam",
    deploymentTarget: .iOS(targetVersion: "16.0",
                           devices: [.iphone],
                           supportsMacDesignedForIOS: false),
    dependencies: [],
    infoPlistPath: "Support/Info.plist",
    scripts: [],
    isResources: true,
    hasTest: false)

let designSystemProject = Project.makeProject(
    name: "DesignSystem",
    targets: designSystemTarget)
