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
    @EnvironmentObject var router: Router
    
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
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 0) {
                            Text("설정된닉넴123")
                                .font(.bold(20))
                                .padding(.vertical, 6)
                            
                            Text("프로필 수정")
                                .font(.semiBold(12))
                                .padding(.vertical, 3)
                                .foregroundStyle(Color.GrayB0B0B0)
                                .onTapGesture {
                                    router.navigateTo(.setting)
                                    print("설정페이지로 이동")
                                }
                        }
                    }
                    
                    MypageDivideComponent(mypageSectionPageModel: mypageSectionPageModel)
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationTitleWithRightButton(title: "마이페이지", text: "설정", {
            router.navigateTo(.setting)
        })
        
    }
}

#Preview {
    NavigationStack {
        MypageMainPage()
    }
}
