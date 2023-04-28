//
//  ScalingGrid.swift
//  memorize
//
//  Created by Slava Rykov on 08.03.2023.
//

import SwiftUI

struct ScalingGrid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    let items: [Item]
    let aspectRatio: CGFloat
    let content: (Item) -> ItemView
    
    init(items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let width: CGFloat = getScaledWidth(dependsOn: items.count, in: geometry.size, with: aspectRatio)
            
            LazyVGrid(columns: [adaptiveGridItem(width: width)]) {
                ForEach(items) { item in
                    content(item).aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func getScaledWidth(dependsOn itemsCount: Int, in size: CGSize, with aspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemsCount
        
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / aspectRatio
            
            if  CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            
            columnCount += 1
            rowCount = (itemsCount + (columnCount)) / columnCount
        } while columnCount < itemsCount
        
        if columnCount > itemsCount {
            columnCount = itemsCount
        }
        
        return floor(size.width / CGFloat(columnCount))
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        GridItem(.adaptive(minimum: width))
    }
}
