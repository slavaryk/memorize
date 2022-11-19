//
//  File.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card] = []
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
