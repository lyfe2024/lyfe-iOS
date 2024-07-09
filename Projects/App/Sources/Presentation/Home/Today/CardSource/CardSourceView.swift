//
//  CardSourceView.swift
//  Lyfe
//
//  Created by 박서연 on 2024/07/10.
//  Copyright © 2024 iOSteam. All rights reserved.
//

import SwiftUI

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
                draggingItem = snappedItem + value.translation.width / 100
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

#Preview {
    TTTTT()
}
