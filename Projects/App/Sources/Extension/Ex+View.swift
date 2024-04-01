//
//  Ex+View.swift
//  Lyfe
//
//  Created by 고세림 on 4/2/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

extension View {
    func navigationBackButton(_ action: @escaping () -> Void) -> some View {
        self.navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: action, label: {
                        Image("arrowBack")
                            .resizable()
                            .frame(width: 24, height: 24)
                    })
                }
            }
    }
    
    func navigationTitle(with text: Text) -> some View {
        VStack(spacing: 31) {
            HStack(spacing: 0) {
                text
                    .font(.bold(18))
                    
                Spacer()
            }
            
            self
        }
    }
}
