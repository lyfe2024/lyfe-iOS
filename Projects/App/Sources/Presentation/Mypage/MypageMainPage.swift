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

class MypageMainViewModel: ObservableObject {
    private let usersNetworkService = UsersNetwork()
    
    @Published var isGuest = AccountStorage.shared.isGuest
    @Published var feedType: FeedType = .board_picture
    @Published var sampleUser = HomeSample.sampleUser
    @Published var nickname: String = ""
    @Published var profileImageUrl: String = ""
    @Published var userBoardList: [BoardResponseDTO] = []
    @Published var userPhotoList: [BoardResponseDTO] = []
    
    func tapSection(_ userChoiced: FeedType) {
        self.feedType = userChoiced
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
    
    func getUserBoardList(_ boardType: FeedType) {
        guard !isGuest else { return }
        
        usersNetworkService.userBoardList("0", "BOARD") { reult in
            switch reult {
            case .success(let success):
                self.userBoardList = success.list
            case .failure(let failure):
                print("🐛 SY Failure) My page user board list failure \(failure.localizedDescription)")
            }
        }
        
        usersNetworkService.userBoardList("0", "BOARD_PICTURE") { result in
            switch result {
            case .success(let success):
                self.userPhotoList = success.list
            case .failure(let failure):
                print("🐛 SY Failure) My page user photo list failure \(failure.localizedDescription)")
            }
        }
    }
    
    
}

struct MypageMainPage: View {
    
    @StateObject var viewModel = MypageMainViewModel()
    @EnvironmentObject var router: Router
    
    var body: some View {
        ScrollView {
            Section {
                switch viewModel.feedType {
                case .board_picture:
                    if viewModel.isGuest {
                        NoneUserPage()
                    } else {
                        MypagePhotoPage(viewModel: viewModel)
                    }
                case .board:
                    if viewModel.isGuest {
                        NoneUserPage()
                    } else {
                        MypagePostPage(viewModel: viewModel)
                    }
                }
                
            } header: {
                headerrView()
            }
            .padding(.horizontal, 20)
        }
        .LyfeNaivigationRButton("마이페이지", "설정") {
            router.navigateTo(.setting)
        }
        .onAppear {
            viewModel.isGuest = AccountStorage.shared.isGuest
            viewModel.getUserBoardList(viewModel.feedType)
            viewModel.getProfile()
        }
    }
    
    @ViewBuilder func headerrView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                if viewModel.isGuest {
                    DesignSystemAsset.icGrayNoneUser.swiftUIImage
                        .resizable()
                        .frame(width: 48, height: 48)
                } else {
                    if viewModel.profileImageUrl.isEmpty {
                        DesignSystemAsset.icGrayNoneUser.swiftUIImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                    } else if let url = URL(string: viewModel.profileImageUrl) {
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
                    if viewModel.isGuest {
                        Text("로그인이 필요해요")
                            .font(.bold(20))
                            .padding(.vertical, 6)
                    } else {
                        Text(viewModel.nickname)
                            .font(.bold(20))
                            .padding(.vertical, 6)
                        
                        Text("프로필 수정")
                            .font(.semiBold(12))
                            .padding(.vertical, 3)
                            .foregroundStyle(Color.GrayB0B0B0)
                            .onTapGesture {
                                router.navigateTo(.updateProfile(viewModel.profileImageUrl, viewModel.nickname))
                            }
                    }
                }
            }
            
            MypageDivideComponent(viewModel: viewModel)
        }
    }
}

#Preview {
    MypageMainPage()
}
