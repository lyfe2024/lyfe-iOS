//
//  GirdCardPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/08.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import Kingfisher

struct GirdCardComponent: View {
    var data: BoardResponseDTO
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            KFImage(URL(string: data.imageUrl  ?? ""))
                .resizable()
                .frame(height: 210)
                .overlay {
                    ZStack {
                        Color.black
                            .opacity(0.4)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack(alignment: .leading) {
                            HStack(spacing: 8) {
                                KFImage(URL(string: data.user?.profile  ?? ""))
                                    .placeholder {
                                        ProgressView()
                                            .tint(Color.mainE86336)
                                    }
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 24, height: 24)
                                    
                                Text("\(data.user?.username ?? "")")
                                    .font(.bold(12))
                                
                                Spacer()
                            }
                            
                            Spacer()
                            Text("\(data.title ?? "")")
                                .lineLimit(2)
                                .font(.bold(14))
                            
                        }
                        .foregroundColor(.white)
                        .padding(10)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            HStack(spacing: 8) {
                HStack(spacing: 2) {
                    Image("GrayWineglass")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("\(data.whiskyCount ?? 0)")
                }
                
                HStack(spacing: 2) {
                    Image("GrayComment")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text("40")
                }
            }
            .foregroundColor(.GrayB0B0B0)
            .font(.semiBold(12))
        }
    }
}

//#Preview {
//    GirdCardPage(data: HomeSample.sampleUser)
//}
