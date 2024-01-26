import ProjectDescription
import ProjectDescriptionHelpers

let appTarget = Target.makeTarget(
    name: "Lyfe",
    platform: .iOS,
    product: .app,
    organizationName: "iOSteam",
    deploymentTarget: .iOS(targetVersion: "16.0",
                           devices: [.iphone],
                           supportsMacDesignedForIOS: false),
    dependencies: [.project(target: "SPM", path: .relativeToRoot("Projects/SPM"))],
    infoPlistPath: "Support/Info.plist",
    //    scripts: [.swiftLintPath], // -> lint 적용o
    scripts: [], // -> lint 적용x
    isResources: true,
    hasTest: true)

let appProject = Project.makeProject(
    name: "Lyfe", 
    targets: appTarget,
    isXconfigSet: true)
