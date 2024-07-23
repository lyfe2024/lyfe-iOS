//
//  MypageDivideComponent.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct MypageDivideComponent: View {
    @ObservedObject var viewModel: MypageMainViewModel
    
    var body: some View {
        HStack{
            ForEach(FeedType.allCases, id: \.self) { choiced in
                VStack {
                    Text("\(choiced.rawValue)")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(viewModel.feedType == choiced ? .MainE86336 : .GrayC6C6C6)
                        .font(viewModel.feedType == choiced ? .bold(18) : .medium(18))
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(viewModel.feedType == choiced ? .MainE86336 : .clear)
                }
                .onTapGesture {
                    viewModel.tapSection(choiced)
                    print(choiced.rawValue)
                }
                .animation(.easeIn, value: viewModel.feedType)
            }
        }
        .onAppear {
            print("viewModel.feedType.rawValue \(viewModel.feedType.rawValue)")
        }
    }
}

#Preview {
    MypageDivideComponent(viewModel: MypageMainViewModel())
}
