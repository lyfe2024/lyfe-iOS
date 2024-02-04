//
//  AAScreen.swift
//  RouteTest
//
//  Created by bjpark-mac on 2024/01/29.
//

import Foundation
import SwiftUI

public struct CCScreen: View {
    
    @StateObject var routeModel: Router<TestNaviItem>
    
    init(routeModel: Router<TestNaviItem>) {
        _routeModel = StateObject(wrappedValue: routeModel)
    }
    
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("CCC")
            
            Button(action: {
                
                routeModel.routeTo(.aaa)
                
            },
                   label: {
                Text("Push")
            })
            
            Button(action: {
                
                routeModel.routeTo(.bbb)
                
            },
                   label: {
                Text("Pop")
            })
            
            Button(action: {
                
                routeModel.routeTo(.ccc)
                
            },
                   label: {
                Text("fullCoverPop")
            })
            
            Button(action: {
                
                routeModel.dismiss()
                
            },
                   label: {
                Text("dismiss")
            })
        }
        .padding()
    }
}
