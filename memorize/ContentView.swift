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
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach(viewModel.cards)
                    {
                        card in
                        CardView(CARD: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .padding(.horizontal)
                .foregroundColor(.blue)
            }
        }
    }
}

struct CardView: View {
    let CARD: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let CARD_SHAPE = RoundedRectangle(cornerRadius: 20)

            if CARD.isFaceUp {
                CARD_SHAPE.fill().foregroundColor(.white)
                CARD_SHAPE.strokeBorder(lineWidth: 3).foregroundColor(.orange)
                Text(CARD.content).font(.largeTitle)
            } else if CARD.isMatched {
                CARD_SHAPE.opacity(0)
            } else {
                CARD_SHAPE.fill()
            }
        }
    }
}

struct ButtonView: View {
    let ACTION: () -> Void
    let LABEL: () -> Text

    var body: some View {
        Button(action: ACTION, label: LABEL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let GAME = EmojiMemoryGame()
        ContentView(viewModel: GAME).preferredColorScheme(.light)
    }
}
