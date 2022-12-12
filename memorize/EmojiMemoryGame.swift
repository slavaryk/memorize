//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static let emojis: [String: EmojiTheme] = [
        "sport": EmojiTheme(
            numberOfPairsOfCards: 8,
            content: ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈"],
            color: Color.blue
        ),
        "vehicles": EmojiTheme(
            numberOfPairsOfCards: 8,
            content: ["🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤"],
            color: Color.orange
        ),
        "gadgets": EmojiTheme(
            numberOfPairsOfCards: 4,
            content: ["⌚️", "📱", "💻", "⌨️", "📷", "🎥", "📟", "🎙️"],
            color: Color.indigo
        ),
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(themes: emojis.keys.sorted())
    }
    
    var chosenTheme: String {
        model.chosenTheme!
    }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func startNewGame() {
        chooseRandomTheme()
        buildCardsFromChosenTheme()
    }
    
    func chooseRandomTheme() {
        model.chooseRandomTheme()
    }
    
    func buildCardsFromChosenTheme() {
        model.buildCardsFromChosenTheme(numberOfPairsOfCards: chosenTheme.count) {
            index in
            EmojiMemoryGame.emojis[chosenTheme]!.content[index]
        }
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    struct EmojiTheme {
        let numberOfPairsOfCards: Int
        let content: [String]
        let color: Color
    }
}
