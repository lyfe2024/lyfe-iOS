//
//  MypagePhotoPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct MypagePhotoPage: View {
    @ObservedObject var viewModel: MypageMainViewModel
    @EnvironmentObject var router: Router
    private let colums: [GridItem] = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        LazyVGrid(columns: colums, content: {
            ForEach(viewModel.userPhotoList, id: \.id) { data in
                GirdCardComponent(data: data)
                    .onTapGesture {
                        router.navigateTo(.postDetail)
                    }
            }
        })
    }
}

#Preview {
    MypagePhotoPage(viewModel: MypageMainViewModel())
}
