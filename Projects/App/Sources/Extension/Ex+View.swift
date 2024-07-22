//
//  Ex+View.swift
//  Lyfe
//
//  Created by 고세림 on 4/2/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

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
                    .applyFont(font: .title1)
                    
                Spacer()
            }
            
            self
        }
    }
    
    func navigationBackButtonWithTitle(title: Text, action: @escaping () -> Void) -> some View {
        self.navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack(spacing: 16) {
                        Button(action: action, label: {
                            Image("arrowBack")
                                .resizable()
                                .frame(width: 24, height: 24)
                        })
                        
                        title
                            .applyFont(font: .title1)
                            
                        Spacer()
                    }
                }
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
                        .applyFont(font: .heading3)
                        .padding(.vertical, 6)
                        .foregroundStyle(Color.black)
                })
                            
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: action, label: {
                        Text(text)
                            .applyFont(font: .button1)
                            .padding(.vertical, 4)
                            .foregroundStyle(Color.MainE86336)
                    })
                }
            }
            .padding(.vertical, 10)
    }
    
    func LyfeNaivigationTitle(_ text: String) -> some View {
        VStack(spacing: 0) {
            Text(text)
                .applyFont(font: .heading3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.init(top: 10,leading: 20,bottom: 10,trailing: 20))
            self.navigationBarBackButtonHidden()
        }
    }
    
    func LyfeNaivigationRButton(_ title: String, _ button: String, _ action: @escaping () -> Void) -> some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .applyFont(font: .heading3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                Text(button)
                    .applyFont(font: .button1)
                    .foregroundStyle(Color.mainE86336)
                    .onTapGesture {
                        action()
                    }
            }
            .padding(.init(top: 10,leading: 20,bottom: 10,trailing: 20))
            
            self.navigationBarBackButtonHidden()
            Spacer()
        }
    }
    
    func LyfeNavigationDoubleButton(_ RImage: Image, _ LImage: Image, LButton: @escaping () -> Void, RButton: @escaping () -> Void) -> some View {
        VStack(spacing: 0) {
            HStack {
                LImage
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        LButton()
                    }
                
                Spacer()
                
                RImage
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        RButton()
                    }
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 20)
            
            self.navigationBarBackButtonHidden()
            Spacer()
        }
    }
}

extension View {
    func screenWidth() -> UIScreen? {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return self.screenWidth()
        }
        
        return window.screen
    }
}
