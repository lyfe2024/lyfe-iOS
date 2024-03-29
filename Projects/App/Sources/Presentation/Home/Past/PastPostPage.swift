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
    @Published var homeSample: [HomeSample] = HomeSample.homeSample
}

struct PastPostPage: View {
    @StateObject var pastPostPageModel = PastPostPageModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            LazyVStack(spacing: 16) {
                ForEach (0..<5, id: \.self) { _ in
                    VStack(alignment: .leading) {
                        Text("여기에 과거 주제 내용 \n문장 들어갑니다.")
                            .font(.bold(22))
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .layoutPriority(2)
                        
                        ChosePostPhotoPage()
                            .layoutPriority(1)
                        
                        Divider()
                            .padding(.vertical, 12)
                        
                        ChosePostGeneralPage()
                            .layoutPriority(0)
                    }
                    .padding(16)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: .black.opacity(0.1), radius: 16, x: 0, y: 8)
                }   
            }
        }
    }
}

#Preview {
    PastPostPage()
}
