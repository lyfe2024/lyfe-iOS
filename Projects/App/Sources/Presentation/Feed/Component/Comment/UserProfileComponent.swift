//
//  UserProfileComponent.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/29.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Kingfisher

struct UserProfileComponent: View {
    let image: String
    let name: String
    let time: String
    let content: String
    let action: () -> Void
    
    init(
        image: String,
        name: String,
        time: String,
        content: String,
        action: @escaping () -> Void
    ) {
        self.image = image
        self.name = name
        self.time = time
        self.content = content
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                KFImage(URL(string: image))
                    .resizable()
                    .frame(width: 24, height: 24)
                    .scaledToFit()
                    .clipShape(Circle())
                Text(name)
                    .applyFont(font: .button3)
                Text(time)
                    .applyFont(font: .caption4)
                    .foregroundColor(.GrayB0B0B0)
                
                Spacer()
                
                LyfeCommon.ic_gray_info
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        action()
                    }
            }
            
            Text(content)
                .applyFont(font: .body3)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

//
//#Preview {
//    UserProfileComponent(infoToggle: false,
//                         image: "Sample1",
//                         name: "홍길동",
//                         time: "1분전",
//                         content: "2줄이상이면 없어지는 말")
//}
