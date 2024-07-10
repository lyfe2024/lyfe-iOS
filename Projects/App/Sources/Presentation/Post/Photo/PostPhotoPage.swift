//
//  PostPhotoPage.swift
//  Lyfe
//
//  Created by 고세림 on 4/17/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import PhotosUI

final class PostPhotoPageModel: ObservableObject {
    private let imageNetworkService = ImageNetwork()
    private let boardNetworkService = BoardNetwork()
    private let baseImageUrl = "https://lyfe-s3.s3.ap-northeast-2.amazonaws.com/"

    @Published var title: String = ""
    @Published var selectedImage: PhotosPickerItem? = nil
    @Published var selectedPhotoData: Data?
    
    func save(completion: @escaping (Bool) -> Void) {
        getUploadUrl { [weak self] url, key in
            guard let data = self?.selectedPhotoData else { return }
            self?.imageNetworkService.uploadImage(url, data: data, completion: { [weak self] successed in
                if successed {
                    self?.saveContent(key: key) { result in
                        completion(result)
                    }
                } else {
                    completion(false)
                }
            })
        }
    }
    
    private func getUploadUrl(completion: @escaping (String, String) -> Void) {
        imageNetworkService
            .uploadUrl { result in
                switch result {
                case .success(let data):
                    if let url = data.url, let key = data.key {
                        completion(url, key)
                    }
                case .failure(_):
                    return
                }
            }
    }
    
    private func saveContent(key: String, completion: @escaping (Bool) -> Void) {
        let url = baseImageUrl + key
        boardNetworkService
            .boards(.board_picture, title: title, content: url, topicId: 1) { result in
                switch result {
                case .success:
                    completion(true)
                case .failure(_):
                    completion(false)
                }
        }
    }
}

struct PostPhotoPage: View {
    @ObservedObject var viewModel: PostPhotoPageModel
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("사진 신청")
                .font(.bold(24))
            
            Spacer()
                .frame(height: 16)
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.GrayF5F5F5)
                    
                    VStack(alignment: .center, spacing: 8) {
                        Image("plus")
                            .resizable()
                            .frame(width: 44, height: 44)
                        
                        Text("사진 업로드")
                            .foregroundStyle(.black)
                            .font(.semiBold(16))
                    }
                    
                    if let selectedPhoto = viewModel.selectedPhotoData,
                       let image = UIImage(data: selectedPhoto) {
                        GeometryReader { geometry in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .compositingGroup()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                                .mask {
                                    RoundedRectangle(cornerRadius: 10)
                                }
                        }
                    }
                }
                .aspectRatio(
                    viewModel.selectedPhotoData == nil ? 320/152 : 1,
                    contentMode: .fit
                )
                .frame(maxWidth: .infinity)
            }
            .onChange(of: viewModel.selectedImage) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        viewModel.selectedPhotoData = data
                    }
                }
            }
            
            Spacer()
                .frame(height: 24)
            
            Text("제목")
                .font(.bold(16))
            
            Spacer()
                .frame(height: 8)
            
            TextInput(text: $viewModel.title)
                .maxCount(20)
                .frame(height: 48)
            
            Spacer()
                .frame(height: 4)
            
            HStack {
                Spacer()
                
                Text("\(viewModel.title.count)/20")
                    .font(.regular(12))
                    .foregroundStyle(Color.Gray9B9B9B)
            }
            
            Spacer()
            
            CommonButton(title: "게시")
                .height(48)
                .enable(
                    !viewModel.title.isEmpty
                    && viewModel.selectedPhotoData != nil
                )
                .tap {
                    viewModel
                        .save() { successed in
                            if successed {
                                router.navigateBack()
                            }
                        }
                }
            Spacer()
                .frame(height: 24)
        }
        .padding(.horizontal, 20)
        .navigationBackButton {
            router.navigateBack()
        }
    }
}

#Preview {
    PostPhotoPage(viewModel: .init())
}
