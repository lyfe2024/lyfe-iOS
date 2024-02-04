import Foundation
import SwiftUI

public struct RouteScreen<Destination: Routable>: View {
    
    @StateObject var routeModel: Router<Destination> = .init(isPresented: .constant(.none))
    
    public init(_ routeType: Destination.Type, rootType: Destination) {
        let router = Router<Destination>(isPresented: .constant(nil))
        router.routeTo(rootType)
        self._routeModel = StateObject(wrappedValue: router)
    }
    
    public var body: some View {
        
        NavigationStack(path: $routeModel.pathList,
                          root: {
            
            RouterRootScreen()
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
