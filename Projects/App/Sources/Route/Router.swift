import SwiftUI

public class Router<Destination: Routable>: ObservableObject {
    /// Used to programatically control a navigation stack
    @Published public var pathList: [Destination] = .init()
    /// Used to present a view using a sheet
    
    @Published public var presentingFullScreenCover: Destination?
    /// Used by presented Router instances to dismiss themselves
    @Published public var isPresented: Binding<Destination?>
    public var isPresenting: Bool {
        presentingFullScreenCover != nil
    }
    
    init(isPresented: Binding<Destination?>) {
        self.isPresented = isPresented
    }
    
    /// Returns the view associated with the specified `Routable`
    @ViewBuilder public func view(for route: Destination) -> some View {
        route.viewToDisplay(router: router(routeType: route.navigationType))
    }
    
    /// Routes to the specified `Routable`.
    public func routeTo(_ route: Destination) {
        switch route.navigationType {
        case .push:
            push(route)
        case .fullScreenCover:
            presentFullScreen(route)
        }
        
        
    }
    
    // Pop to the root screen in our hierarchy
    public func popToRoot() {
        pathList.removeLast(pathList.count)
    }
    public func pop(){
        guard pathList.isEmpty == false else {
            return 
        }
        _ = pathList.removeLast()
    }
    // Dismisses presented screen or self
    public func dismiss() {
        
        if presentingFullScreenCover != nil {
            presentingFullScreenCover = nil
        } else {
            isPresented.wrappedValue = nil
        }
    }
    
    private func push(_ appRoute: Destination) {
        pathList.append(appRoute)
    }
    
    private func presentFullScreen(_ route: Destination) {
        self.presentingFullScreenCover = route
    }
    
    // Return the appropriate Router instance based
    // on `NavigationType`
    private func router(routeType: NavigationType) -> Router {
        switch routeType {
        case .push:
            return self
        case .fullScreenCover:
            return Router(
                isPresented: Binding(
                    get: { self.presentingFullScreenCover },
                    set: { self.presentingFullScreenCover = $0 }
                )
            )
        }
    }
}
