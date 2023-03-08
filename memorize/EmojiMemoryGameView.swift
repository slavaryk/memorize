//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Slava Rykov on 08.11.2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            HStack(spacing: 170.0) {
                Text(game.chosenThemeCapitalizes).font(.caption)
                Text("Score \(game.score)").font(.caption)
            }
            .padding(.top)
            ScalingGrid(items: game.cards, aspectRatio: 2/3) { card in
                CardView(card: card)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
            .padding(.horizontal)
            .foregroundColor(game.themeColor)
            VStack {
                Spacer(minLength: 0)
                HStack {
                    ButtonView(label: { Text("New game").font(.title2) }) {
                        game.startNewGame()
                    }
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let cardShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                
                if card.isFaceUp {
                    cardShape.fill().foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: DrawingConstants.strokeWidth)
                    Text(card.content).font(getFont(dependingOn: geometry.size))
                } else if card.isMatched {
                    cardShape.opacity(0)
                } else {
                    cardShape.fill()
                }
                /**
                 Little padding prevents cards "jumping" when other cards
                 disappearing while playing
                 */
            }
            .padding(0.5)
        }
    }
    
    private func getFont(dependingOn size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 15;
        static let strokeWidth: CGFloat = 3;
        static let fontScale: CGFloat = 0.75;
    }
}

struct ButtonView: View {
    let label: () -> Text
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: label)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}
