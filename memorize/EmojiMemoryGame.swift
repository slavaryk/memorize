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
            numberOfPairsOfCards: 4,
            content: ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈"],
            color: Color.blue
        ),
        "vehicles": EmojiTheme(
            numberOfPairsOfCards: 3,
            content: ["🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤"],
            color: Color.red
        ),
        "gadgets": EmojiTheme(
            numberOfPairsOfCards: 3,
            content: ["⌚️", "📱", "💻", "⌨️", "📷", "🎥", "📟", "🎙️"],
            color: Color.indigo
        ),
        "halloween": EmojiTheme(
            numberOfPairsOfCards: 3,
            content: ["🎃", "💀", "👻", "🫥", "👹", "👽", "🤖", "🧻"],
            color: Color.orange
        ),
    ]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(themes: emojis.keys.sorted())
    }
    
    var chosenTheme: String {
        model.chosenTheme ?? "Tap 'New game'"
    }
    
    var chosenThemeCapitalized: String {
        self.chosenTheme.capitalized
    }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    func startNewGame() {
        chooseRandomTheme()
        buildCardsFromChosenTheme()
        shuffleCards()
        resetScore()
    }
    
    func chooseRandomTheme() {
        model.chooseRandomTheme()
    }
    
    func buildCardsFromChosenTheme() {
        model.buildCardsFromChosenTheme(
            numberOfPairsOfCards: EmojiMemoryGame.emojis[chosenTheme]?.numberOfPairsOfCards ?? 0,
            content: EmojiMemoryGame.emojis[chosenTheme]?.content ?? []
        )
    }
    
    func shuffleCards() {
        model.shuffleCards()
    }
    
    func resetScore() {
        model.resetScore()
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
