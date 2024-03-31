//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 박서연 on 2024/01/25.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(name: "Lyfe", projects: ["Projects/App",
                                                   "Projects/SPM",
                                                   "Projects/DesignSystem",], additionalFiles: ["README.md"])

