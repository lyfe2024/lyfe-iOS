//
//  FeedDetailView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/04.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class PhotoFeedDeatilPageModel: ObservableObject {
    @Published var postUser: HomeSample = HomeSample.sampleUser
    @Published var popupToggle: Bool = false
}

// 사진 피드 상세 뷰
struct PhotoFeedDetailPage: View {
    @StateObject var photoFeedDetailPageModel = PhotoFeedDeatilPageModel()
    let photoSize = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView {
            Spacer().frame(height: 16)
            
            VStack(alignment: .leading) {
                Text("여기에 오늘의 주제문장 들어갑니다.")
                    .font(.bold(22))
                    .foregroundColor(.MainE86336)
                    .padding(.leading, 20)
                
                ZStack(alignment: .bottomLeading) {
                    ZStack {
                        Rectangle()
                            .fill(.black)
                            .frame(width: photoSize, height: photoSize)
                            .overlay {
                                Image(photoFeedDetailPageModel.postUser.image)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                
                                ZStack {
                                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                                    startPoint: .top, endPoint: .bottom)
                                }
                                .opacity(0.8)
                            }
                    }
                    
                    Text(photoFeedDetailPageModel.postUser.title)
                        .font(.bold(20))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 16)
                        .lineLimit(2)
                        .lineSpacing(1.5)
                }
                
                // 글쓴이 정보뷰
                PostUserComponent(postUser: photoFeedDetailPageModel.postUser)
                .padding(.horizontal, 20)
                
                RectangleComponent()
                
                LazyVStack {
                    ForEach(0..<10, id:\.self) { index in
                        CommentUserPage(sampleUser: photoFeedDetailPageModel.postUser, commentUser: HomeSample.homeSample, infoButtonTooggle: photoFeedDetailPageModel.popupToggle)
                        Divider()
                            .padding(.vertical, 4)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .onTapGesture {
            if photoFeedDetailPageModel.popupToggle {
                photoFeedDetailPageModel.popupToggle = false
            }
        }
    }
}

#Preview {
    PhotoFeedDetailPage()
}
