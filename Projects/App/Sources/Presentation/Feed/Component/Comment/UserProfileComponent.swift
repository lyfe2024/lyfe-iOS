//
//  UserProfileComponent.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/29.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct UserProfileComponent: View {
    let image: String
    let name: String
    let time: String
    let content: String
    @State var infoToggle: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(image)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .scaledToFit()
                    .clipShape(Circle())
                Text(name)
                    .font(.regular(14))
                Text(time)
                    .font(.regular(12))
                    .foregroundColor(.GrayB0B0B0)
                
                Spacer()
                
                Button {
                    print("Info 버튼 tapped")
                    self.infoToggle.toggle()
                } label: {
                    Image("Info")
                        .frame(width: 24, height: 24)
                }
            }
            
            Text(content)
                .font(.regular(14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(alignment: .topTrailing) {
                    FeedPopup(popupType: .doubleBtn, isPopup: infoToggle)
                }
        }
        .onTapGesture {
            if infoToggle {
                infoToggle = false
            }
        }
    }
}


#Preview {
    UserProfileComponent(image: "Sample1", name: "홍길동", time: "1분전", content: "2줄이상이면 없어지는 말", infoToggle: false)
}
