//
//  TopicAPITest.swift
//  Lyfe
//
//  Created by 박서연 on 2024/06/02.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

struct TopicAPITest: View {
    private let networkService = TopicNetwork()
    
    var body: some View {
        VStack {
            Text("Test")
        }
        
        .onAppear {
            networkService.getTodayTopic { result in
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    TopicAPITest()
}
