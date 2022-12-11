//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static let EMOJIS: [[String]] = [
        ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈"],
        ["🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤"],
        ["⌚️", "📱", "💻", "⌨️", "📷", "🎥", "📟", "🎙️"],
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in
            EmojiMemoryGame.EMOJIS[0][index]
        }
    }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
