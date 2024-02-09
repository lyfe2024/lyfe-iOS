//
//  HomeSampleData.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

/// 샘플 데이터
struct HomeSample {
    let userName: String
    let profile: String = "PhotoSample"
    let updatedAt: String
    let image: String
    let title: String
    let content: String
    let whisky: Int
    
    /// 샘플 유저1
    static let sampleUser = HomeSample(userName: "홍길동", updatedAt: "2024-02-10", image: "Sample3", title: "여기 텍스트 기반 피드 제목 들어옵니다. ", content: "여기는 내용 들어옵니다. 여기는 내용 들어옵니다. 여기는 내용 들어옵니다. 여기는 내용 들어옵니다. 여기는 내용 들어옵니다. 여기는 내용 들어옵니다. ", whisky: 11)
    
    /// 글 상세 조회 샘플 5명
    static let homeSample = [HomeSample(userName: "유저이름",
                                        updatedAt: "1분전",
                                        image: "Sample1",
                                        title: "제목입니다",
                                        content: "글 내용",
                                        whisky: 40),
                             
                             HomeSample(userName: "유저2",
                                        updatedAt: "2분전",
                                        image: "Sample2",
                                        title: "제목입니다제목입니다",
                                        content: "글 내용", 
                                        whisky: 9),
                             
                             HomeSample(userName: "유저3",
                                        updatedAt: "3분전",
                                        image: "Sample3",
                                        title: "제목입니다제목입니다제목입니다",
                                        content: "글 내용",
                                        whisky: 43),
                             
                             HomeSample(userName: "유저4",
                                        updatedAt: "4분전",
                                        image: "Sample4",
                                        title: "제목입니다제목입니다제목입니다제목입니다",
                                        content: "글 내용",
                                        whisky: 1),
                             
                             HomeSample(userName: "유저5",
                                        updatedAt: "5분전",
                                        image: "Sample5",
                                        title: "제목입니다제목입니다제목입니다제목입니다제목입니다",
                                        content: "글 내용",
                                        whisky: 52)]
   
}
