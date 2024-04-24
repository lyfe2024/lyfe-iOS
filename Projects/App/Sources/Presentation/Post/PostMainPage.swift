//
//  PostMainPage.swift
//  Lyfe
//
//  Created by 고세림 on 4/17/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct PostMainPage: View {
    var tapDimView: (() -> Void)?
    
    init(tapDimView: (() -> Void)? = nil) {
        self.tapDimView = tapDimView
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                        .frame(width: 16)
                    
                    Image("picFill")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Spacer()
                        .frame(width: 8)
                    
                    Text("사진 신청하기")
                        .font(.bold(14))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                .frame(width: 144, height: 32)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.MainE86336)
                )
                
                HStack {
                    Spacer()
                        .frame(width: 16)
                    
                    Image("text2Line")
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Spacer()
                        .frame(width: 8)
                    
                    Text("고민글 작성하기")
                        .font(.bold(14))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                .frame(width: 144, height: 32)
                .foregroundStyle(.black)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(Color.MainE86336)
                )
                
                Spacer()
                    .frame(height: 100)
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .onTapGesture {
            tapDimView?()
        }
    }
}

#Preview {
    PostMainPage()
}
