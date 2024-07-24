//
//  CardSourceView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct Item: Identifiable {
    var id: Int
    var title: String
    var color: Color
}

class Store: ObservableObject {
    @Published var items: [Item]
    
    let colors: [Color] = [.red, .orange, .blue, .teal, .mint, .green, .gray, .indigo, .black]
    
    // dummy data
    init() {
        items = []
        for i in 0...7 {
            let new = Item(id: i, title: "Item \(i)", color: colors[i])
            items.append(new)
        }
    }
}

struct TTTTT: View {
    
    @StateObject var store = Store()
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var activeIndex: Int = 0
    
    var body: some View {
        
        ZStack {
            ForEach(store.items) { item in
                
                // article view
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(item.color)
                    Text(item.title)
                        .padding()
                }
                .frame(width: 200, height: 200)
                
                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                .opacity(1.0 - abs(distance(item.id)) * 0.3 )
                .offset(x: myXOffset(item.id), y: 0)
                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
            }
        }
        .gesture(getDragGesture())
        .onTapGesture {
            //move card to centre
        }
    }
    
    private func getDragGesture() -> some Gesture {
        
        DragGesture()
            .onChanged { value in
//                draggingItem = snappedItem + value.translation.width / 100
            }
            .onEnded { value in
                withAnimation {
                    draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                    draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                    snappedItem = draggingItem
                    
                    //Get the active Item index
                    self.activeIndex = store.items.count + Int(draggingItem)
                    if self.activeIndex > store.items.count || Int(draggingItem) >= 0 {
                        self.activeIndex = Int(draggingItem)
                    }
                }
            }
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
        return sin(angle) * 200
    }
}

struct DDDD: View {
    
    @StateObject var viewModel = HomeMainPageModel()
    
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var activeIndex: Int = 0
    
    var body: some View {
        
        ZStack {
            ForEach(viewModel.totalData.indices, id: \.self) { index in
                Group {
                    if let boardData = viewModel.totalData[index] as? BoardResponseDTO {
                        CardView(data: boardData)
                    } else if let color = viewModel.totalData[index] as? Color {
                        Rectangle()
                            .fill(color)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay {
                                VStack {
                                    Circle()
                                        .fill(Color.gray9B9B9B)
                                        .frame(width: 128, height: 128)
                                        .overlay {
                                            VStack(spacing: 4) {
                                                LyfeCommon.ic_white_arrow_after
                                                    .resizable()
                                                    .frame(width: 56, height: 56)
                                                Text("더보기")
                                                    .applyFont(font: .heading5)
                                                    .foregroundStyle(Color.white)
                                            }
                                        }
                                }
                            }
                    }
                }
                .frame(width: 200, height: 200)
                .scaleEffect(1.0 - abs(distance(index)) * 0.2 )
                .opacity(1.0 - abs(distance(index)) * 0.3 )
                .offset(x: myXOffset(index), y: 0)
                .zIndex(1.0 - abs(distance(index)) * 0.1)
            }
        }
        .onAppear {
            viewModel.getLatestBoard(.board_picture)
        }
        .gesture(getDragGesture())
        .onTapGesture {
            //move card to centre
        }
    }
    
    private func getDragGesture() -> some Gesture {
        
        DragGesture()
            .onChanged { value in
                draggingItem = snappedItem + value.translation.width / 100
            }
            .onEnded { value in
                withAnimation {
                    draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                    draggingItem = round(draggingItem).remainder(dividingBy: Double(viewModel.totalData.count))
                    snappedItem = draggingItem
                    
                    //Get the active Item index
                    self.activeIndex = viewModel.totalData.count + Int(draggingItem)
                    if self.activeIndex > viewModel.totalData.count || Int(draggingItem) >= 0 {
                        self.activeIndex = Int(draggingItem)
                    }
                }
            }
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(viewModel.totalData.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(viewModel.totalData.count) * distance(item)
        return sin(angle) * 200
    }
}

#Preview {
    DDDD()
}
