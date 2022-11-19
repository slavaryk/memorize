//
//  File.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card] = []
    
    init(numberOfPairsOfCards: Int, content: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairsOfCards {
            cards.append(Card(content: content(index)))
            cards.append(Card(content: content(index)))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
