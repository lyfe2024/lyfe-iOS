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
    @Published var title: String = ""
    @Published var selectedImage: PhotosPickerItem? = nil
    @Published var selectedPhotoData: Data?
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
                    // save photo 
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
