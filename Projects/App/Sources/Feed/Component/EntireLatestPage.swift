//
//  EntireLastestPage.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/03.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct EntireLatestPage: View {
    var data: HomeSample
    var cardValue: CardValue
    
    var body: some View {
        VStack {
            Image("\(data.image)")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    ZStack(alignment: .leading) {
                        Color.black
                            .opacity(0.4)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 8) {
                                Image(data.profile)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 32, height: 32)
                                
                                Text("\(data.userName)")
                                    .font(.bold(16))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            Text("\(data.title)")
                                .lineLimit(2)
                                .font(.bold(22))
                                .foregroundColor(.white)
                        }
                        .padding(10)
                    }
                }
            
            HStack(spacing: 8) {
                HStack(spacing: 0) {
                    Image("GrayWine")
                        .frame(width: 16, height: 16)
                    Text("40")
                        .foregroundColor(.GrayB0B0B0)
                        .font(.semiBold(12))
                }
                
                HStack(spacing: 0) {
                    Image("GrayComment")
                        .frame(width: 16, height: 16)
                    Text("8")
                        .foregroundColor(.GrayB0B0B0)
                        .font(.semiBold(12))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    EntireLatestPage(data: HomeSample.sampleUser, cardValue: CardValue.today)
}
