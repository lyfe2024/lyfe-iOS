import SwiftUI

enum TestNaviItem: Routable {
//    typealias ViewType = View
    
    var navigationType: NavigationType {
        switch self {
        case .ccc:
            return .fullScreenCover
            
        default:
            return .push
        }
    }
    
    case aaa
    case bbb
    case ccc
    
    @ViewBuilder
    func viewToDisplay(router: Router<TestNaviItem>) -> some View {
        
        switch self {
        case .aaa:
            AAScreen(routeModel: router)
            
        case .bbb:
            BBScreen(routeModel: router)
            
        case .ccc:
            CCScreen(routeModel: router)
        
        }
    }
}
