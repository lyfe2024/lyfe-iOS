import Foundation
import SwiftUI

public struct RouteScreen<RootV: View, Destination: Routable>: View {
    
    @StateObject var routeModel: Router<Destination> = .init(isPresented: .constant(.none))
    
    private let rootContentV: (Router<Destination>) -> RootV
    public init(_ routeType: Destination.Type,
                @ViewBuilder content: @escaping (Router<Destination>) -> RootV) {
        self.rootContentV = content
    }
    
    public var body: some View {
        
        NavigationStack(path: $routeModel.pathList,
                          root: {
            
            self.rootContentV(routeModel)
                .navigationDestination(for: Destination.self,
                                       destination: { innerRouteType in
                    routeModel.view(for: innerRouteType)
                })
            
        })
        .fullScreenCover(item: $routeModel.presentingFullScreenCover) { route in
            routeModel.view(for: route)
        }
        
    }
}
