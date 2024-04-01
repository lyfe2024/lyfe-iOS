//
//  MypageMainPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

enum MypageInfo: String, CaseIterable {
    case photo = "신청 사진"
    case post = "고민글"
}

class MypageSectionPageModel: ObservableObject {
    @Published var userChoiced: MypageInfo = .photo
    @Published var sampleUser = HomeSample.sampleUser
    
    func tapSection(_ userChoiced: MypageInfo) {
        self.userChoiced = userChoiced
    }
}

struct MypageMainPage: View {
    
    @StateObject var mypageSectionPageModel = MypageSectionPageModel()
    
    var body: some View {
        ScrollView {
            Section {
                switch mypageSectionPageModel.userChoiced {
                case .photo:
                    MypagePhotoPage()
                case .post:
                    MypagePostPage()
                }
            } header: {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image("\(mypageSectionPageModel.sampleUser.image)")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .scaledToFit()
                            .clipShape(Circle())
                        Text("익명의 쿼카")
                            .font(.bold(20))
                    }
                    MypageDivideComponent(mypageSectionPageModel: mypageSectionPageModel)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    MypageMainPage()
}
