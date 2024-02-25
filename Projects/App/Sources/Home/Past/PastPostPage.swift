//
//  PastPostView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

class PastPostPageModel: ObservableObject {
    @Published var sequence: ContentSequence = .popular
    @Published var sampleData: HomeSample = HomeSample.sampleUser
}

struct PastPostPage: View {
    @StateObject var pastPostPageModel = PastPostPageModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("여기에 과거 주제 내용 \n문장 들어갑니다.")
                    .font(.pretendardBold22)
                    .foregroundColor(.black)
                    .lineLimit(2)
                    .layoutPriority(2)
                
                ChosePostPhotoView()
                    .layoutPriority(1)
                
                Divider()
                    .padding(.vertical, 12)
                
                ChosePostGeneralView()
                    .layoutPriority(0)
            }
            .padding(16)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.1), radius: 16, x: 0, y: 8)
        }
    }
}

#Preview {
    PastPostPage()
}
