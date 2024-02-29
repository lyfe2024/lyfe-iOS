//
//  ModiDeletePopup.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum userPopup {
    case singleBtn
    case doubleBtn
}

// 수정 삭제 팝업
struct FeedPopup: View {
    let popupType: userPopup
    var isPopup: Bool
    
    var body: some View {
        ZStack {
            switch popupType {
            case .singleBtn:
                ButtonView(title: "신고") {
                    // 신고
                    print("신고 button tapped")
                }
            case .doubleBtn:
                VStack(spacing: 3) {
                    ButtonView(title: "수정") {
                        // 수정
                        print("수정 button tapped")
                    }
                    Divider()
                    ButtonView(title: "삭제") {
                        // 삭제
                        print("삭제 button tapped")
                    }
                }
            }
        }
        .frame(width: 57, height: 64)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.Gray727272, lineWidth: 0.3) // 테두리 추가
        )
        .opacity(isPopup ? 1 : 0)
        .zIndex(5)
    }
}

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding(.vertical, 5)
                .foregroundColor(.Gray727272)
                .font(.pretendardRegular14)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    FeedPopup(popupType: .doubleBtn, isPopup: true)
}
