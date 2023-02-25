//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
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
        MemoryGame<String>()
    }
    
    @Published private var memoryGame: MemoryGame<String>
    private var themes: Themes
    
    init() {
        themes = Themes(themes: EmojiMemoryGame.emojis.keys.sorted())
        memoryGame = EmojiMemoryGame.createMemoryGame()
    }
    
    var chosenTheme: String {
        themes.chosenTheme ?? "Tap 'New game'"
    }
    
    var chosenThemeCapitalized: String {
        self.chosenTheme.capitalized
    }

    var cards: [MemoryGame<String>.Card] {
        memoryGame.cards
    }
    
    var score: Int {
        memoryGame.score
    }
    
    func startNewGame() {
        chooseRandomTheme()
        resetCards()
        buildCardsFromChosenTheme()
        shuffleCards()
        resetScore()
    }
    
    func chooseRandomTheme() {
        themes.chooseRandomTheme()
    }
    
    func resetCards() {
        memoryGame.resetCards()
    }
    
    func buildCardsFromChosenTheme() {
        memoryGame.buildCards(
            numberOfPairsOfCards: EmojiMemoryGame.emojis[chosenTheme]?.numberOfPairsOfCards ?? 0,
            content: EmojiMemoryGame.emojis[chosenTheme]?.content ?? []
        )
    }
    
    func shuffleCards() {
        memoryGame.shuffleCards()
    }
    
    func resetScore() {
        memoryGame.resetScore()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        memoryGame.choose(card)
    }
    
    struct EmojiTheme {
        let numberOfPairsOfCards: Int
        let content: [String]
        let color: Color
    }
}
