//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 박서연 on 2024/01/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let spmTarget = Target.makeTarget(
    name: "SPM",
    platform: .iOS,
    product: .framework,
    organizationName: "iOSteam",
    deploymentTarget: .iOS(targetVersion: "15.0",
                           devices: [.iphone],
                           supportsMacDesignedForIOS: false),
    dependencies: [.SPM.KingFisher],
    infoPlistPath: "",
    scripts: [],
    isResources: false,
    hasTest: false)

let spmProject = Project.makeProject(
    name: "SPM",
    targets: spmTarget)
