import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/


public extension Project {
    /// 프로젝트 정의하는 함수 생성
    static func makeProject(
        name: String,
        organizationName: String = Environment.organizationName,
        targets: [Target],
        isXconfigSet: Bool = false,
        additionalFiles: [FileElement] = []
    ) -> Project {
        guard !targets.isEmpty else { return .init(name: "ErrorProject")}
        
        // target이 앱인 경우에만 사용
        let isProductApp = targets.contains { target in target.product == .app }
        
        // target -> app인 경우에만 Setting
        var setting: Settings?
        if isProductApp, isXconfigSet {
            setting = Settings.settings(configurations: [
                .debug(name: "Debug", xcconfig: .relativeToRoot("Projects/App/Resources/Config/Secrets.xcconfig")),
                .release(name: "Release", xcconfig: .relativeToRoot("Projects/App/Resources/Config/Secrets.xcconfig")),
            ], defaultSettings: .recommended)
        } else {
            setting = .settings(base: [:],
                                configurations: [.debug(name: .debug),
                                                 .release(name: .release)],
                                defaultSettings: .recommended)
        }
        
        // target -> app인 경우에만 Scheme
        var scheme: [Scheme] = []
        if isProductApp {
            scheme =  [.makeScheme(target: .debug, name: name)]
        }
        
        return Project(
            name: name,
            organizationName: organizationName,
            options: .options(
                defaultKnownRegions: ["en", "ko"],
                developmentRegion: "ko"
            ),
            settings: setting,
            targets: targets,
            schemes: scheme,
            additionalFiles: additionalFiles
        )
    }
}


//extension Project {
//    /// Helper function to create the Project for this ExampleApp
//    public static func app(name: String, destinations: Destinations, additionalTargets: [String]) -> Project {
//        var targets = makeAppTargets(name: name,
//                                     destinations: destinations,
//                                     dependencies: additionalTargets.map { TargetDependency.target(name: $0) })
//        targets += additionalTargets.flatMap({ makeFrameworkTargets(name: $0, destinations: destinations) })
//        return Project(name: name,
//                       organizationName: "tuist.io",
//                       targets: targets)
//    }
//
//    // MARK: - Private
//
//    /// Helper function to create a framework target and an associated unit test target
//    private static func makeFrameworkTargets(name: String, destinations: Destinations) -> [Target] {
//        let sources = Target(name: name,
//                destinations: destinations,
//                product: .framework,
//                bundleId: "io.tuist.\(name)",
//                infoPlist: .default,
//                sources: ["Targets/\(name)/Sources/**"],
//                resources: [],
//                dependencies: [])
//        let tests = Target(name: "\(name)Tests",
//                destinations: destinations,
//                product: .unitTests,
//                bundleId: "io.tuist.\(name)Tests",
//                infoPlist: .default,
//                sources: ["Targets/\(name)/Tests/**"],
//                resources: [],
//                dependencies: [.target(name: name)])
//        return [sources, tests]
//    }
//
//    /// Helper function to create the application target and the unit test target.
//    private static func makeAppTargets(name: String, destinations: Destinations, dependencies: [TargetDependency]) -> [Target] {
//        let infoPlist: [String: Plist.Value] = [
//            "CFBundleShortVersionString": "1.0",
//            "CFBundleVersion": "1",
//            "UILaunchStoryboardName": "LaunchScreen"
//            ]
//
//        let mainTarget = Target(
//            name: name,
//            destinations: destinations,
//            product: .app,
//            bundleId: "io.tuist.\(name)",
//            infoPlist: .extendingDefault(with: infoPlist),
//            sources: ["Targets/\(name)/Sources/**"],
//            resources: ["Targets/\(name)/Resources/**"],
//            dependencies: dependencies
//        )
//
//        let testTarget = Target(
//            name: "\(name)Tests",
//            destinations: destinations,
//            product: .unitTests,
//            bundleId: "io.tuist.\(name)Tests",
//            infoPlist: .default,
//            sources: ["Targets/\(name)/Tests/**"],
//            dependencies: [
//                .target(name: "\(name)")
//        ])
//        return [mainTarget, testTarget]
//    }
//}
