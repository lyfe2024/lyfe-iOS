////
////  CommentComponent.swift
////  Lyfe
////
////  Created by 박서연 on 2024/05/03.
////  Copyright © 2024 iOSteam. All rights reserved.

import SwiftUI
import DesignSystem

struct CommentComponent: View {
    @Binding var userName: String
    @State private var comment: String = ""
    @FocusState private var focuseField: FocuseField?
    @ObservedObject var viewModel: ContentFeedDetailPageModel
    
    private enum FocuseField {
        case comment
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 2){
                UserNameView(userName: $userName)
                Text("님 에게 답글 남기는 중")
                    .font(.regular(12))
                    .padding(.vertical, 3)
                
                Spacer()
                Button {
                    viewModel.commentState = false
                } label: {
                    Text("취소")
                        .foregroundStyle(Color.Gray727272)
                        .font(.regular(12))
                        .padding(.vertical, 3)
                }
            }
            
            HStack(alignment: .bottom, spacing: 4) {
                TextEditor(text: $comment)
                    .applyFont(font: .body3)
                    .lineLimit(3)
                    .frame(height: 82)
                    .focused($focuseField, equals: .comment)
                Button {
                    viewModel.commentState = false
                } label: {
                    Image("ic_arrowup_white")
                        .frame(width: 20, height: 20)
                        .background(Color.MainE86336)
                        .clipShape(Circle())
                }
                .frame(width: 32, height: 32)
            }
            .padding(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.MainE86336, lineWidth: 1)
            )
        }
        .padding(.horizontal, 12)
        .onAppear {
            focuseField = .comment
        }
    }
}

struct UserNameView: View {
    @Binding var userName: String
    
    var body: some View {
        Text("@\(userName)")
            .foregroundStyle(Color.MainE86336)
            .padding(.init(top: 1, leading: 4, bottom: 1, trailing: 4))
            .background(Color.MainFFD0BB)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .font(.regular(10))
            .padding(.vertical, 3)
    }
}

#Preview {
    CommentComponent(userName: .constant("유저이름"), viewModel: ContentFeedDetailPageModel())
}
