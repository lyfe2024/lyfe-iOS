//
//  UserExperiencePage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct UserExperiencePage: View {
    @State private var content: String = ""
    private var placeholder = "내용을 입력해주세요"
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("사용경험")
                    .font(.bold(24))
                    .padding(.vertical, 12)
                
                Text("Lyfe에서의 경험을 편하게 말씀해주세요.\n긍정/부정적인 피드백 무엇이든 괜찮아요.")
                    .font(.medium(14))
                    .padding(.vertical, 8)
            }
            
            TextEditor(text: $content)
                .font(.medium(16))
                .foregroundColor(.black)
                .padding(12)
                .background(alignment: .topLeading) {
                    if content.isEmpty {
                        Text(placeholder)
                            .font(.medium(16))
                            .padding(.vertical, 8)
                            .padding(12)
                            .foregroundColor(Color.GrayC6C6C6)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 176)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .scrollContentBackground(.hidden)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(content.isEmpty ? Color.GrayC6C6C6 : Color.black, lineWidth: 1)
                        .frame(maxWidth: .infinity, maxHeight: 176)
                )
                .onChange(of: content) { newValue in
                    if newValue.count > 200 {
                        content = String(newValue.prefix(500))
                    }
                }
            
            HStack(spacing: 0) {
                Spacer()
                Text("\(content.count)/")
                    .foregroundStyle(Color.GrayC6C6C6)
                Text("500")
                    .foregroundStyle(Color.Gray9B9B9B)
            }
            .font(.regular(12))
            
            Spacer()
            
            Button {
                print("피드백 보내기 임시버튼 tapped")
            } label: {
                Text("피드백 보내기 임시버튼")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .foregroundColor(.white)
                    .background(Color.MainE86336)
                    .font(.semiBold(16))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.vertical, 8) // lineHeight : 24
            }
            .padding(.bottom, 24)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    UserExperiencePage()
}
