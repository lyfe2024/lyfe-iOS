
import Foundation
import SwiftUI

enum LoginRouteItem: Routable {
    
//    typealias ViewType = View
    
    var navigationType: NavigationType {
        switch self {
        default:
            return .push
        }
    }
    
    
    case main
    case nickName
    case term
    case termDetail
    case privacyDetail
    case joinCompleted
    
    @ViewBuilder
    func viewToDisplay(router: Router<LoginRouteItem>) -> some View {
        switch self {
        case .main:
            EmptyView()
        default:
            EmptyView()
        }
    }
}
