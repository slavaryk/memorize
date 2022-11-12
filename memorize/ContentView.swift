//
//  ContentView.swift
//  memorize
//
//  Created by Слава Рыков on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    let CARDS_CONTENT_LIST = ["⚽️", "🏀", "🏐", "⚾️"]
    
    var body: some View {
        HStack {
            ForEach(CARDS_CONTENT_LIST, id: \.self)
            {
                content in
                CardView(CONTENT: content)
            }
        }
        .padding(.horizontal )
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
                CARD_SHAPE.stroke(lineWidth: 3).foregroundColor(.blue)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
