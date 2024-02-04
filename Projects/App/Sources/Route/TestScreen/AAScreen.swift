//
//  AAScreen.swift
//  RouteTest
//
//  Created by bjpark-mac on 2024/01/29.
//

import Foundation
import SwiftUI

public struct AAScreen: View {
    
    @StateObject var routeModel: Router<TestNaviItem>
    
    init(routeModel: Router<TestNaviItem>) {
        _routeModel = StateObject(wrappedValue: routeModel)
    }
    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("AAA")
            
            Button(action: {
                
                routeModel.routeTo(.bbb)
                
            },
                   label: {
                Text("Push")
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
