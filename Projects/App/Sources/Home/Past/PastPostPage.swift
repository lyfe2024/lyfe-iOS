//
//  PastPostView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class PastPostPageModel: ObservableObject {
    // 오늘 날짜..?
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd."
        return formatter
    }()
    
    let date = dateFormatter.string(from: Date())
    
    @Published var sequence: ContentSequence = .popular
    @Published var sampleData: HomeSample = HomeSample.sampleUser
    @Published var postPicker: HomePicker = .past
}

struct PastPostPage: View {
    @StateObject var pastPostPageModel = PastPostPageModel()
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topTrailing) {
                Spacer().frame(height: 20)
                Text(pastPostPageModel.date)
                    .foregroundColor(.black)
                    .opacity(0.1)
                    .font(.thinkRegular80)
                    
                
                VStack(alignment: .leading) {
                    Image("Logo")
                    Spacer().frame(height: 21)
                    
                    HomePickerPage(selected: $pastPostPageModel.postPicker)
                    Spacer().frame(height: 9)
                    
                    VStack(alignment: .leading) {
                        Text("여기에 과거 주제 내용 \n문장 들어갑니다.")
                            .font(.pretendardBold22)
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .layoutPriority(1) // 일반 글 포스트 limitline 조절
                        
                        ChosePostPhotoView()

                        Divider()
                            .padding(.vertical, 12)
                        
                        ChosePostGeneralView()
                    }
                    .padding(16)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.1), radius: 16, x: 0, y: 8)
                }
                .padding(20)
            }
            
        }
        .background(Color.backgroundFf5f5f5)
    }
}

#Preview {
    //    PastPostPage(sampleData: HomeSample.sampleUser)
    PastPostPage()
}
