//
//  HomeSampleData.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

// 샘플 데이터
struct HomeSample {
    let user: String
    let time: String
    let image: String
    let title: String
    let whiskey: Int
    
    static let homeSample = [HomeSample(user: "유저1",
                                        time: "몇분전",
                                        image: "PhotoSample",
                                        title: "제목입니다",
                                        whiskey: 40),
                             HomeSample(user: "유저2",
                                        time: "몇분전",
                                        image: "PhotoSample",
                                        title: "제목222",
                                        whiskey: 5),
                             HomeSample(user: "유저3",
                                        time: "몇분전",
                                        image: "PhotoSample",
                                        title: "제목3333",
                                        whiskey: 5),
                             HomeSample(user: "유저4",
                                        time: "몇분전",
                                        image: "PhotoSample",
                                        title: "제목44444",
                                        whiskey: 5)]
}
