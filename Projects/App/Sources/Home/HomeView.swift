//
//  HomeView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/01/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum ContentSequence {
    case latest
    case popular
}

struct HomeView: View {
    
    @State var sequence: ContentSequence = .latest
    
    // 유저프로필 샘플 
    @State var name: String = "유저이름"
    @State var time: String = "몇 분전"
    @State var photo: String = "CircleSample1"
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Spacer().frame(height: 20)
            Text("09.24.")
                .foregroundColor(.black)
                .opacity(0.1)
                .font(.thinkRegular80)
            
            VStack(alignment: .leading) {
                Image("Logo")
                
                Text("여름과 가을 사이 \n두줄일 경우는 이렇게") // 두줄 테스트
                    .lineSpacing(2)
                    .font(.pretendardBold28)
                    .foregroundColor(.MainE86336)
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 350)
                    .foregroundColor(.gray)
                
                HStack {
                    Text("고민글")
                        .font(.pretendardBold20)
                    Spacer()
                    SequenceView(sequence: $sequence)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    ContentUserView(name: $name, time: $time, photo: $photo)
                    Text("여기 텍스트 기반 피드 제목 들어옵니다. ")
                        .font(.custom(CustomFont.bold, size: 16))
                    Text("여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지")
                        .lineLimit(3)
                        .lineSpacing(1.5)
                        .font(.pretendardSemiBold14)
                }
            }
        }
        .padding(20)
    }
}

struct SequenceView: View {
    @Binding var sequence: ContentSequence
    
    var body: some View {
        HStack(spacing: 4) {
            Button {
                sequence = .latest
            } label: {
                Text("최신순")
                    .foregroundColor(sequence == .latest ? .MainE86336 : .GrayC6C6C6)
                    .font(sequence == .latest ? .pretendardBold14 : .pretendardRegular14)
            }
                
            Text("|")
                .foregroundColor(.GrayC6C6C6)
            
            Button {
                sequence = .popular
            } label: {
                Text("인기순")
                    .foregroundColor(sequence == .popular ? .MainE86336 : .GrayC6C6C6)
                    .font(sequence == .popular ? .pretendardBold14 : .pretendardRegular14)
            }
        }
    }
}

// 공통으로 사용?
struct ContentUserView: View {
    @Binding var name: String
    @Binding var time: String
    @Binding var photo: String // 예비
    
    var body: some View {
        HStack(spacing: 8) {
            Image(photo)
                .font(.pretendardBold14)
            Text(name)
                .font(.pretendardRegular14)
            Text(time)
                .font(.pretendardRegular10)
                .foregroundColor(.GrayC6C6C6)
        }
    }
}

#Preview {
    HomeView()
}
