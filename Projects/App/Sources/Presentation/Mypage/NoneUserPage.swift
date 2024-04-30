//
//  NoneUserPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct NoneUserPage: View {
    var body: some View {
        VStack {
            Text("로그인 하시면 신청한 사진,\n작성한 고민글을 모아 볼 수 있어요")
                .multilineTextAlignment(.center)
                .font(.bold(18))
                .padding(.vertical, 10)
                .foregroundColor(.Gray393939)
            
            Spacer().frame(height: 40)
            
            Button {
                print("로그인하러 가기")
            } label: {
                Text("로그인 하러 가기")
                    .font(.semiBold(16))
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.MainE86336)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 82)
            }
            
            Spacer().frame(height: 8)
            
            Text("아직 회원이 아니신가요?")
                .foregroundStyle(Color.GrayB0B0B0)
                .font(.medium(14))
        }
    }
}

#Preview {
    NoneUserPage()
}
