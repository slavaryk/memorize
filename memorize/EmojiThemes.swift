//
//  EmojiThemes.swift
//  memorize
//
//  Created by Slava Rykov on 12.03.2023.
//

import SwiftUI

class EmojiThemes: ObservableObject {
    typealias EmojiTheme = (
        name: String, contentAmount: Int, content: [String], color: Color
    )
    
    private static let themesList: [EmojiTheme] = [
        (
            name: "sport",
            contentAmount: 7,
            content: ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈"],
            color: Color.blue
        ),
        (
            name: "vehicles",
            contentAmount: 8,
            content: ["🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤"],
            color: Color.red
        ),
        (
            name: "gadgets",
            contentAmount: 4,
            content: ["⌚️", "📱", "💻", "⌨️", "📷", "🎥", "📟", "🎙️"],
            color: Color.indigo
        ),
        (
            name: "halloween",
            contentAmount: 5,
            content: ["🎃", "💀", "👻", "🫥", "👹", "👽", "🤖", "🧻"],
            color: Color.blue
        ),
    ]
    
    @Published private var themes: Themes<String, Color>
    
    init() {
        themes = Themes()
        buildThemes()
    }
    
    func buildThemes() {
        for theme in EmojiThemes.themesList {
            themes.addNew(
                name: theme.name,
                contentAmount: theme.contentAmount,
                content: theme.content,
                color: theme.color
            )
        }
    }
}
