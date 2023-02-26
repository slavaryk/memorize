//
//  ContentView.swift
//  memorize
//
//  Created by Slava Rykov on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            HStack(spacing: 170.0) {
                Text(viewModel.chosenThemeCapitalized).font(.caption)
                Text("Score \(viewModel.score)").font(.caption)
            }
            .padding(.top)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards)
                    {
                        card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding(.horizontal)
            .foregroundColor(viewModel.themeColor)
            Spacer()
            HStack {
                ButtonView(label: { Text("New game").font(.title2) }) {
                    viewModel.startNewGame()
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)

            if card.isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                cardShape.opacity(0)
            } else {
                cardShape.fill()
            }
        }.padding(0.5)
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
        ContentView(viewModel: game).preferredColorScheme(.light)
    }
}
