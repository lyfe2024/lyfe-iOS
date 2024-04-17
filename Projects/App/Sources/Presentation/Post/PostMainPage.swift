//
//  PostMainPage.swift
//  Lyfe
//
//  Created by 고세림 on 4/17/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct PostMainPage: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.1)
            
            VStack {
                Spacer()
                
                HStack {
                    Text("사진 신청하기")
                }
                .frame(width: 144, height: 32)
                .foregroundStyle(.black)
                
                Spacer()
                    .frame(height: 100)
            }
        }
        .background(Color.clear.onTapGesture {
            
        })
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PostMainPage()
}
