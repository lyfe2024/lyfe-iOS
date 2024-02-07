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
    let userImage: String = "PhotoSample"
    let time: String
    let image: String
    let title: String
    let whisky: Int
    
    static let homeSample = [HomeSample(user: "유저이름",
                                        time: "1분전",
                                        image: "Sample1",
                                        title: "제목입니다",
                                        whisky: 40),
                             HomeSample(user: "유저2",
                                        time: "2분전",
                                        image: "Sample2",
                                        title: "제목입니다제목입니다",
                                        whisky: 9),
                             HomeSample(user: "유저3",
                                        time: "3분전",
                                        image: "Sample3",
                                        title: "제목입니다제목입니다제목입니다",
                                        whisky: 43),
                             HomeSample(user: "유저4",
                                        time: "4분전",
                                        image: "Sample4",
                                        title: "제목입니다제목입니다제목입니다제목입니다",
                                        whisky: 1),
                             HomeSample(user: "유저5",
                                        time: "5분전",
                                        image: "Sample5",
                                        title: "제목입니다제목입니다제목입니다제목입니다제목입니다",
                                        whisky: 52)]
    
    static let moreSample = [HomeSample(user: "유저6",
                                       time: "6분전",
                                       image: "Sample6",
                                       title: "제목입니다",
                                       whisky: 40),
                            HomeSample(user: "유저7",
                                       time: "7분전",
                                       image: "Sample7",
                                       title: "제목입니다제목입니다",
                                       whisky: 9),
                            HomeSample(user: "유저8",
                                       time: "8분전",
                                       image: "Sample8",
                                       title: "제목입니다제목입니다제목입니다",
                                       whisky: 43),
                            HomeSample(user: "유저9",
                                       time: "9분전",
                                       image: "Sample9",
                                       title: "제목입니다제목입니다제목입니다제목입니다",
                                       whisky: 1),
                            HomeSample(user: "유저10",
                                       time: "10분전",
                                       image: "Sample10",
                                       title: "제목입니다제목입니다제목입니다제목입니다제목입니다",
                                       whisky: 52)]
   
}
