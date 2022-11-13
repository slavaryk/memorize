//
//  ContentView.swift
//  memorize
//
//  Created by Слава Рыков on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    let CARDS_CONTENT_LIST = ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈", "🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤", "⌚️", "📱", "💻", "⌨️", "📷", "🎥"]
    @State var cardsCount = 6
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(CARDS_CONTENT_LIST[0..<cardsCount], id: \.self)
                    {
                        content in
                        CardView(CONTENT: content).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            HStack {
                ButtonView(ACTION: {
                    guard cardsCount < CARDS_CONTENT_LIST.count else { return }
                    cardsCount += 1
                }) { Image(systemName: "plus.circle") }
                Spacer()
                ButtonView(ACTION: {
                    guard cardsCount > 1 else { return }
                    cardsCount -= 1
                }) { Image(systemName: "minus.circle")
                     }
            }
            .padding(15)
            .font(.largeTitle)
        }
    }
}

struct CardView: View {
    let CONTENT: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let CARD_SHAPE  = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                CARD_SHAPE.fill().foregroundColor(.white)
                CARD_SHAPE.stroke(lineWidth: 3).foregroundColor(.orange)
                Text(CONTENT).font(.largeTitle)
            } else {
                CARD_SHAPE.fill().foregroundColor(.blue)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ButtonView: View {
    let ACTION: () -> Void
    let LABEL: () -> Image
    var body: some View {
        Button(action: ACTION, label: LABEL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
