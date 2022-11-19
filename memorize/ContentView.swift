//
//  ContentView.swift
//  memorize
//
//  Created by Слава Рыков on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    let CARDS: [[String]] = [
        ["⚽️", "🏀", "🏐", "⚾️", "🎱", "🎾", "🏉", "🏈"],
        ["🛸", "🚀", "🛰️", "🚁", "🛩️", "🛶", "⛵️", "🚤"],
        ["⌚️", "📱", "💻", "⌨️", "📷", "🎥", "📟", "🎙️"],
    ]
    @State var CARDS_CONTENT_LIST: [String] = []

    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(CARDS_CONTENT_LIST, id: \.self)
                    {
                        content in
                        CardView(CONTENT: content).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding(.all)
            }
            
            Spacer()

            HStack {
                ForEach(CARDS, id: \.self.hashValue)
                {
                    cardsList in
                    ButtonView(ACTION: {
                        CARDS_CONTENT_LIST = cardsList.shuffled()
                    }) { Text(cardsList[0]) }

                }
                .frame(width: 100)
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
    let LABEL: () -> Text

    var body: some View {
        Button(action: ACTION, label: LABEL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
