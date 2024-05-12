//
//  MypageDivideComponent.swift
//  Lyfe
//
//  Created by 박서연 on 2024/03/30.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct MypageDivideComponent: View {
    @ObservedObject var mypageSectionPageModel: MypageSectionPageModel
    
    var body: some View {
        HStack{
            ForEach(MypageInfo.allCases, id: \.self) { choiced in
                VStack {
                    Text("\(choiced.rawValue)")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(mypageSectionPageModel.userChoiced == choiced ? .MainE86336 : .GrayC6C6C6)
                        .font(mypageSectionPageModel.userChoiced == choiced ? .bold(18) : .medium(18))
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(mypageSectionPageModel.userChoiced == choiced ? .MainE86336 : .clear)
                }
                .onTapGesture {
                    mypageSectionPageModel.tapSection(choiced)
                    print(choiced.rawValue)
                }
                .animation(.easeIn, value: mypageSectionPageModel.userChoiced)
            }
        }
    }
}

#Preview {
    MypageDivideComponent(mypageSectionPageModel: MypageSectionPageModel())
}
