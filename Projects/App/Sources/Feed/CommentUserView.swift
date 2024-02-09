//
//  CommentUserView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

/// 댓글 유저 공통 컴포넌트
struct CommentUserView: View {
    var sampleUser: HomeSample
    
    var body: some View {
        VStack(alignment:.leading, spacing: 8) {
            // 유저 정보
            HStack(spacing: 8) {
                Image("Sample1")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .clipShape(Circle())
                Text("유저")
                    .font(.pretendardRegular12)
                Text("몇분전")
                    .font(.pretendardRegular10)
                    .foregroundColor(.GrayB0B0B0)
                
                Spacer()
                
                Button {
                    print("info button tapped")
                } label: {
                    Image("Info")
                        .frame(width: 24, height: 24)
                }
            }
            
            // 댓글 내용
            Text("여기는 내용 들어옵니다. 최대 2줄까지라고 되어 있는데 꼭 2줄 제한을 둬야 할까요? 안해도 괜찮을것 같습니다만.. 글자수로 제한을 둬야 하지 않을까 싶네요?")
                .font(.pretendardRegular14)
                .lineLimit(3)
            
            // 답글 버튼
            Button {
                print("답글달기 버튼 tapped")
            } label: {
                Text("답글달기")
                    .font(.pretendardRegular12)
                    .foregroundStyle(Color.GrayB0B0B0)
            }
        }
    }
}

#Preview {
    CommentUserView(sampleUser: HomeSample.sampleUser)
}
