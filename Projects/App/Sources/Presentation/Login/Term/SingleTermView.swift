//
//  SingleTermView.swift
//  Lyfe
//
//  Created by 고세림 on 4/3/24.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct SingleTermView: View {
    @Binding var isChecked: Bool
    var term: Term
    var tapTitle: (Term) -> Void
    
    init(
        isChecked: Binding<Bool>,
         term: Term,
         tapTitle: @escaping (Term) -> Void
    ) {
        self._isChecked = isChecked
        self.term = term
        self.tapTitle = tapTitle
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
                .frame(width: 10)
            
            ZStack {
                Image(
                    isChecked
                      ? "CheckBoxSelected"
                      : "CheckBoxDefault"
                )
                .resizable()
                .frame(width: 20, height: 20)
            }
            .frame(width: 32, height: 32)
            .onTapGesture {
                isChecked.toggle()
            }
            
            Spacer()
                .frame(width: 8)
            
            Text(term.title)
                .font(.regular(14))
                .foregroundStyle(.black)
                .underline()
                .onTapGesture {
                    tapTitle(term)
                }
            
            Spacer()
        }
        .frame(height: 40)
    }
}
    
