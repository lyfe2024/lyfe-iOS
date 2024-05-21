////
////  CommentComponent.swift
////  Lyfe
////
////  Created by 박서연 on 2024/05/03.
////  Copyright © 2024 iOSteam. All rights reserved.
////
//
//import SwiftUI
//
//struct CommentComponent: View {
//    @Binding var userName: String
//    @State var comment: String = ""
//    @ObservedObject var contentFeedDetailPageModel: ContentFeedDetailPageModel
//    
//    var body: some View {
//        VStack(spacing: 4) {
//            HStack(spacing: 2){
//                UserNameView(userName: $userName)
//                Text("님 에게 답글 남기는 중")
//                    .font(.regular(12))
//                    .padding(.vertical, 3)
//                
//                Spacer()
//                Button {
////                    contentFeedDetailPageModel.commentState.toggle()
//                } label: {
//                    Text("취소")
//                        .foregroundStyle(Color.Gray727272)
//                        .font(.regular(12))
//                        .padding(.vertical, 3)
//                }
//            }
//            
//            HStack(spacing: 4) {
//                TextEditor(text: $comment)
//                    .font(.medium(14))
//                    .padding(.vertical, 4)
//                    .lineLimit(3)
//                    .frame(height: 80)
//                
//                Button {
////                    contentFeedDetailPageModel.commentState.toggle()
//                } label: {
//                    Image("ic_arrowup_white")
//                        .frame(width: 20, height: 20)
//                        .background(Color.MainE86336)
//                        .clipShape(Circle())
//                }
//                .frame(width: 32, height: 32)
//                .alignmentGuide(.bottom, computeValue: { dimension in
//                    dimension[.bottom] * 0.1
//                })
//            }
//            .padding(.init(top: 12, leading: 8, bottom: 8, trailing: 0))
//            .overlay(
//                RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color.MainE86336, lineWidth: 1)
//            )
//        }
//        .padding(.horizontal, 12)
//    }
//}
//
//struct UserNameView: View {
//    @Binding var userName: String
//    
//    var body: some View {
//        Text("@\(userName)")
//            .foregroundStyle(Color.MainE86336)
//            .padding(.init(top: 1, leading: 4, bottom: 1, trailing: 4))
//            .background(Color.MainFFD0BB)
//            .clipShape(RoundedRectangle(cornerRadius: 4))
//            .font(.regular(10))
//            .padding(.vertical, 3)
//    }
//}
//
//#Preview {
//    CommentComponent(userName: .constant("유저이름"), contentFeedDetailPageModel: ContentFeedDetailPageModel())
//}
