//
//  EmojiThemesView.swift
//  memorize
//
//  Created by Slava Rykov on 12.03.2023.
//

import SwiftUI

struct EmojiThemesView: View {
    @ObservedObject var viewModel = EmojiThemes()
    
    var body: some View {
        NavigationView {
            List(viewModel.themesList) { theme in
                NavigationLink {
                    EmojiMemoryGameView(game: EmojiMemoryGame(content: theme.content))
                } label: {
                    Text(theme.name.capitalized)
                }
            }
            .navigationTitle("Choose theme")
        }
    }
}

struct EmojiThemesView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiThemesView()
    }
}
