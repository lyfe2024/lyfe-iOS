//
//  MypageMainPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem
import Kingfisher

enum MypageInfo: String, CaseIterable {
    case photo = "신청 사진"
    case post = "고민글"
}

class MypageSectionPageModel: ObservableObject {
    private let usersNetworkService = UsersNetwork()
    
    @Published var isGuest = AccountStorage.shared.isGuest
    @Published var userChoiced: MypageInfo = .photo
    @Published var sampleUser = HomeSample.sampleUser
    @Published var nickname: String = ""
    @Published var profileImageUrl: String = ""
    
    func tapSection(_ userChoiced: MypageInfo) {
        self.userChoiced = userChoiced
    }
    
    func getProfile() {
        guard !isGuest else { return }
        
        usersNetworkService
            .usersMe { [weak self] result in
                switch result {
                case .success(let data):
                    self?.nickname = data.username ?? ""
                    self?.profileImageUrl = data.profile ?? ""
                case .failure:
                    return
                }
            }
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
                    if mypageSectionPageModel.isGuest {
                        NoneUserPage()
                    } else {
                        MypagePhotoPage()
                    }
                case .post:
                    if mypageSectionPageModel.isGuest {
                        NoneUserPage()
                    } else {
                        MypagePostPage()
                    }
                }
            } header: {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        if mypageSectionPageModel.isGuest {
                            DesignSystemAsset.icGrayNoneUser.swiftUIImage
                                .resizable()
                                .frame(width: 48, height: 48)
                        } else {
                            if mypageSectionPageModel.profileImageUrl.isEmpty {
                                DesignSystemAsset.icGrayNoneUser.swiftUIImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                            } else if let url = URL(string: mypageSectionPageModel.profileImageUrl) {
                                KFImage(url)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                            } else {
                                DesignSystemAsset.icGrayNoneUser.swiftUIImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                            }
                        }
                        
                        Spacer()
                            .frame(width: 16)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            if mypageSectionPageModel.isGuest {
                                Text("로그인이 필요해요")
                                    .font(.bold(20))
                                    .padding(.vertical, 6)
                            } else {
                                Text(mypageSectionPageModel.nickname)
                                    .font(.bold(20))
                                    .padding(.vertical, 6)
                                
                                Text("프로필 수정")
                                    .font(.semiBold(12))
                                    .padding(.vertical, 3)
                                    .foregroundStyle(Color.GrayB0B0B0)
                                    .onTapGesture {
                                        router.navigateTo(.setting)
                                    }
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
        .onAppear {
            mypageSectionPageModel.isGuest = AccountStorage.shared.isGuest
            mypageSectionPageModel.getProfile()
        }
    }
}

#Preview {
    NavigationStack {
        MypageMainPage()
    }
}
