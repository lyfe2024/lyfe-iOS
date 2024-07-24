//
//  HomeSampleData.swift
//  Lyfe
//
//  Created by 박서연 on 2024/02/06.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import Foundation

struct PublicSample {
    static let title = "여기 텍스트 기반 피드 제목 들어옵니다. "
    static let content = "여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지. 여기는 내용 들어옵니다. 최대 2줄까지"
    static let comment = "여기에 댓글을 달면 어떻게 되는지 한번 봅시다.여기 길어지면 이거 자동으로 늘어나려나 오 되dasdasfasfasfasfsfasf"
}

/// 샘플 데이터
struct HomeSample: Hashable {
    let userName: String
    let profile: String = "PhotoSample"
    let updatedAt: String
    let image: String
    let title: String
    let content: String
    let whisky: Int
    
    static let realData: BoardResponseDTO = .init(id: 1999, user: User(id: 4, username: "normalUser2", profile: "https://picsum.photos/700/700"),
                                                  title: "게시글997", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                  boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z")
    static let realArray: [BoardResponseDTO] = [HomeSample.realData,
                                                .init(id: 1999,
                                                      user: User(id: 1,username: "normalUser1999", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글1999", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2000,
                                                      user: User(id: 2,username: "normalUser2000", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2000", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2001,
                                                      user: User(id: 3,username: "normalUser2001", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2001", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2002,
                                                      user: User(id: 5,username: "normalUser2002", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2002", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2003,
                                                      user: User(id: 6,username: "normalUser2001", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2003", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2004,
                                                      user: User(id: 7,username: "normalUser2002", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2004", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2005,
                                                      user: User(id: 8,username: "normalUser2003", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2005", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2006,
                                                      user: User(id: 9,username: "normalUser2004", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2006", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
                                                .init(id: 2007,
                                                      user: User(id: 10,username: "normalUser2005", profile: "https://picsum.photos/700/700"),
                                                      title: "게시글2007", content: "https://picsum.photos/700/700", topic: "주제12", imageUrl: "https://picsum.photos/700/700",
                                                      boardType: "BOARD", whiskyCount: 0, commentCount: 0, updateAt: "2024-04-11T16:11:47.014801Z"),
    
    ]

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
    
    static let homeSample2 = [HomeSample(userName: "유저이름",
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
