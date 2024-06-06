//
//  PostTextPage.swift
//  Lyfe
//
//  Created by 고세림 on 5/8/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

final class PostTextPageModel: ObservableObject {
    private let networkService = BoardNetwork()
    
    @Published var title: String = ""
    @Published var content: String = ""
    
    func save(completion: @escaping (Bool) -> Void) {
        networkService
            .boards(.board, title: title, content: content, topicId: 1) { result in
                switch result {
                case .success:
                    completion(true)
                case .failure(_):
                    completion(false)
                }
            }
    }
}

struct PostTextPage: View {
    @ObservedObject var viewModel: PostTextPageModel
    @EnvironmentObject var router: Router
    @State private var showToast: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("고민글 작성")
                .font(.bold(24))
            
            Spacer()
                .frame(height: 16)
            
            Text("제목")
                .font(.bold(16))
            
            Spacer()
                .frame(height: 8)
            
            TextInput(text: $viewModel.title)
                .maxCount(20)
                .font(.regular(16))
                .placeholder("제목을 입력해주세요")
                .placeholderFont(.regular(16))
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
                .frame(height: 16)
            
            Text("고민 내용")
                .font(.bold(16))
            
            Spacer()
                .frame(height: 8)
            
            HStack(spacing: 0) {
                TextField(
                    "",
                    text: $viewModel.content,
                    prompt: Text("내용을 입력해주세요")
                        .foregroundColor(Color.GrayC6C6C6)
                        .font(.regular(16)),
                    axis: .vertical
                )
                .frame(height: 176, alignment: .top)
                .font(.regular(16))
                .foregroundStyle(Color.Gray363636)
                .padding(12)
                .disableAutocorrection(true)
                .onReceive($viewModel.content.wrappedValue.publisher.collect()) {
                    let text = String($0.prefix(500))
                    if $viewModel.content.wrappedValue != text {
                        $viewModel.content.wrappedValue = text
                    }
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        $viewModel.content.wrappedValue.isEmpty
                        ? Color.GrayC6C6C6 
                        : Color.Gray363636
                        , lineWidth: 1
                    )
                )
            
            Spacer()
                .frame(height: 4)
            
            HStack {
                Spacer()
                
                Text("\(viewModel.content.count)/500")
                    .font(.regular(12))
                    .foregroundStyle(Color.Gray9B9B9B)
            }
            
            Spacer()
            
            CommonButton(title: "게시")
                .height(48)
                .enable(
                    !viewModel.title.isEmpty
                    && !viewModel.content.isEmpty
                )
                .tap {
                    viewModel.save() { success in
                        if success {
                            router.navigateBack()
                        } else {
                            showToast = true
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
        .showToast("작성에 실패했습니다. 다시 시도해주세요.", show: $showToast)
    }
}

#Preview {
    PostTextPage(viewModel: .init())
}
