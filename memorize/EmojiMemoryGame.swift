//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis: [[String]] = [
        ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈"],
        ["🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤"],
        ["⌚️", "📱", "💻", "⌨️", "📷", "🎥", "📟", "🎙️"],
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in
            EmojiMemoryGame.emojis[0][index]
        }
    }

    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    
}
