//
//  FeedDetailView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/04.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct FeedDetailView: View {
    // 유저프로필 샘플
    @State var name: String = "유저이름"
    @State var time: String = "몇 분전"
    @State var photo: String = "CircleSample1"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("여기에 오늘의 주제문장 들어갑니다.")
                .font(.pretendardBold20)
                .foregroundColor(.MainE86336)
                .padding(.leading, 20)
            
            ZStack(alignment: .bottomLeading) {
                Image("PhotoSample")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("사진 제목 텍스트 \n두줄까지 들어가고 넘어가는건 어떠떨까요")
                    .font(.pretendardBold18)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 16)
            }
            
            HStack {
                HStack {
                    HStack(spacing: 4){
                        Image("Whisky")
                        Text("4")
                    }
                    
                    HStack(spacing: 2) {
                        Image("Comment")
                        Text("댓글")
                        Text("8")
                    }
                }
                
                Spacer()
                
                FeedUserView(name: $name,
                                time: $time,
                                photo: $photo)
            }
            .padding(.horizontal, 20)
            
            VStack(alignment: .leading) {
                CommonUserView()
                    
                Text("여기는 내용 들어옵니다. 최대 2줄까지라고 되어 있는데 꼭 2줄 제한을 둬야 할까요? 안해도 괜찮을것 같습니다만.. 글자수로 제한을 둬야 하지 않을까 싶네요?")
                    .font(.pretendardRegular14)
                    .lineLimit(2)
            }
            .padding(.horizontal, 20)
            
        }
    }
}

// 공통으로 사용?
struct FeedUserView: View {
    @Binding var name: String
    @Binding var time: String
    @Binding var photo: String // 예비
    
    var body: some View {
        HStack(spacing: 8) {
            Image(photo)
                .font(.pretendardBold14)
            VStack(alignment: .leading, spacing: 0){
                Text(name)
                    .font(.pretendardRegular14)
                Text(time)
                    .font(.pretendardRegular10)
                    .foregroundColor(.GrayC6C6C6)
            }
        }
    }
}

struct CommonUserView: View {
    var body: some View {
        HStack(spacing: 8) {
            Image("CircleSample1")
            Text("유저")
            Text("몇분전")
        }
        
    }
}

#Preview {
    FeedDetailView()
}
