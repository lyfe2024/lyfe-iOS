//
//  HomeSampleData.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

/// 샘플 데이터
struct HomeSample: Hashable {
    let userName: String
    let profile: String = "PhotoSample"
    let updatedAt: String
    let image: String
    let title: String
    let content: String
    let whisky: Int
    
    /// 샘플 유저1
    static let sampleUser = HomeSample(userName: "홍길동",
                                       updatedAt: "2024-02-10",
                                       image: "Sample3",
                                       title: "여기 텍스트 기반 피드 제목 들어옵니다. ",
                                       content: "국회나 그 위원회의 요구가 있을 때에는 국무총리·국무위원 또는 정부위원은 출석·답변하여야 하며, 국무총리 또는 국무위원이 출석요구를 받은 때에는 국무위원 또는 정부위원으로 하여금 출석·답변하게 할 수 있다. ",
                                       whisky: 11)
    
    /// 글 상세 조회 샘플 5명
    static let homeSample = [HomeSample(userName: "유저이름",
                                        updatedAt: "1분전",
                                        image: "Sample3",
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
                                        image: "Sample1",
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
