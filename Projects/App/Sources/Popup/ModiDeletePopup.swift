//
//  ModiDeletePopup.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

// 수정 삭제 팝업
struct ModiDeletePopup: View {
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .fill(.white)
                    .overlay {
                        VStack(spacing: 1) {
                            Button {
                                print("수정 button tapped")
                            } label: {
                                Text("수정")
                                    .padding(.vertical, 5)
                            }
                            
                            Rectangle()
                                .fill(Color.GrayDDDDDD)
                                .frame(height: 1)
                            
                            Button {
                                print("삭제 button tapped")
                            } label: {
                                Text("삭제")
                                    .padding(.vertical, 5)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .foregroundColor(.Gray727272)
                        .font(.pretendardRegular14)
                    }
            }
            .frame(width: 57, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 6))
        }
    }
}

#Preview {
    ModiDeletePopup()
}
