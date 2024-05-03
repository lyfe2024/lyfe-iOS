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
    
    func navigationRightButton(image: String, _ action: @escaping () -> Void) -> some View {
        self
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: action, label: {
                        Image(image)
                            .resizable()
                            .frame(width: 24, height: 24)
                    })
                }
            }
    }
    
    func navigationTitleWithRightButton(title: String, text: String, _ action: @escaping () -> Void) -> some View {
        self
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Text(title)
                        .font(.bold(24))
                        .padding(.vertical, 6)
                        .foregroundStyle(Color.black)
                })
                            
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: action, label: {
                        Text(text)
                            .font(.semiBold(16))
                            .padding(.vertical, 4)
                            .foregroundStyle(Color.MainE86336)
                    })
                }
            }
            .padding(.vertical, 10)
    }
}
