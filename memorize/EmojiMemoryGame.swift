//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis: [String: EmojiTheme] = [
        "sport": EmojiTheme(
            numberOfPairsOfCards: 7,
            content: ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈"],
            color: Color.blue
        ),
        "vehicles": EmojiTheme(
            numberOfPairsOfCards: 6,
            content: ["🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤"],
            color: Color.red
        ),
        "gadgets": EmojiTheme(
            numberOfPairsOfCards: 4,
            content: ["⌚️", "📱", "💻", "⌨️", "📷", "🎥", "📟", "🎙️"],
            color: Color.indigo
        ),
        "halloween": EmojiTheme(
            numberOfPairsOfCards: 5,
            content: ["🎃", "💀", "👻", "🫥", "👹", "👽", "🤖", "🧻"],
            color: Color.orange
        ),
    ]
    
    private static func createMemoryGame() -> MemoryGame<String> {
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
    
    var chosenThemeCapitalizes: String {
        self.chosenTheme.capitalized
    }
    
    var themeColor: Color {
        EmojiMemoryGame.emojis[chosenTheme]?.color ?? .blue
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
