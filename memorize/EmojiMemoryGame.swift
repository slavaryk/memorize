//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>()
    }
    
    @Published private var memoryGame: MemoryGame<String>
    
    init(content: [String]) {
        memoryGame = EmojiMemoryGame.createMemoryGame()
        buildCards(content: content)
        shuffleCards()
    }

    var cards: [MemoryGame<String>.Card] {
        memoryGame.cards
    }
    
    var score: Int {
        memoryGame.score
    }
    
    func resetCards() {
        memoryGame.resetCards()
    }
    
    func buildCards(content: [String]) {
        memoryGame.buildCards(
            numberOfPairsOfCards: 7,
            content: content
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
}
