//
//  File.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card] = []
    private(set) var theme: String = ""
    private var firstChosenCardIndex: Int?
    
    init(numberOfPairsOfCards: Int, content: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<numberOfPairsOfCards {
            cards.append(Card(id: index*2, content: content(index)))
            cards.append(Card(id: index*2+1, content: content(index)))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenCardIndex = cards.firstIndex { $0.id == card.id }
        guard let safeChosenCardIndex = chosenCardIndex else { return }
        guard !cards[safeChosenCardIndex].isFaceUp else { return }
        guard !cards[safeChosenCardIndex].isMatched else { return }
        handleChoosing(of: safeChosenCardIndex)
    }
    
    mutating func handleChoosing(of cardIndex: Int) {
        if let _ = firstChosenCardIndex {
            checkMatching(with: cardIndex)
        } else {
            turnAllCardsFaceDown()
            firstChosenCardIndex = cardIndex
        }
        cards[cardIndex].isFaceUp.toggle()
    }
    
    mutating func checkMatching(with cardIndex: Int) {
        let isMatching = cards[firstChosenCardIndex!].content == cards[cardIndex].content
        if isMatching { markMatching(with: cardIndex) }
        firstChosenCardIndex = nil
    }
    
    mutating func markMatching(with cardIndex: Int) {
        cards[firstChosenCardIndex!].isMatched = true
        cards[cardIndex].isMatched = true
    }
    
    mutating func turnAllCardsFaceDown() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
    }
}
