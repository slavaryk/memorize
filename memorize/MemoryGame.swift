//
//  File.swift
//  memorize
//
//  Created by Slava Rykov on 19.11.2022.
//

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var score: Int = 0
    private(set) var cards: [Card] = []
    private var firstChosenCardIndex: Int?
    
    mutating func choose(_ card: Card) {
        let chosenCardIndex = cards.firstIndex { $0.id == card.id }
        guard let safeChosenCardIndex = chosenCardIndex else { return }
        guard !cards[safeChosenCardIndex].isFaceUp else { return }
        guard !cards[safeChosenCardIndex].isMatched else { return }
        handleChoosing(of: safeChosenCardIndex)
    }
    
    private mutating func handleChoosing(of cardIndex: Int) {
        if let _ = firstChosenCardIndex {
            checkMatching(with: cardIndex)
        } else {
            turnAllCardsFaceDown()
            firstChosenCardIndex = cardIndex
        }
        
        cards[cardIndex].isFaceUp.toggle()
        resolveScore(of: cardIndex)
        if !cards[cardIndex].isSeen { cards[cardIndex].isSeen = true }
    }
    
    private mutating func checkMatching(with cardIndex: Int) {
        let isMatching = cards[firstChosenCardIndex!].content == cards[cardIndex].content
        if isMatching { markMatching(with: cardIndex) }
        firstChosenCardIndex = nil
    }
    
    private mutating func markMatching(with cardIndex: Int) {
        cards[firstChosenCardIndex!].isMatched = true
        cards[cardIndex].isMatched = true
    }
    
    private mutating func turnAllCardsFaceDown() {
        for index in cards.indices {
            cards[index].isFaceUp = false
        }
    }
    
    private mutating func resolveScore(of cardIndex: Int) {
        if (cards[cardIndex].isMatched) { score += 2; return }
        if (cards[cardIndex].isSeen) { score -= 1 }
    }
    
    mutating func resetCards() {
        cards = []
    }
    
    mutating func buildCards(numberOfPairsOfCards: Int, content: [CardContent]) {
        var actualNumberOfPairsOfCards = numberOfPairsOfCards
        var changeableContent = Array(content)
        
        if actualNumberOfPairsOfCards > content.count {
            actualNumberOfPairsOfCards = content.count
        }
        
        for index in 0..<actualNumberOfPairsOfCards {
            if let safeRandomContentElement = changeableContent.randomElement() {
                cards.append(Card(id: index*2, content: safeRandomContentElement))
                cards.append(Card(id: index*2+1, content: safeRandomContentElement))
                
                changeableContent.remove(at: changeableContent.firstIndex(of: safeRandomContentElement)!)
            }
        }
    }
    
    mutating func shuffleCards() {
        cards.shuffle()
    }
    
    mutating func resetScore() {
        score = 0
    }
    
    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var isSeen: Bool = false
    }
}
