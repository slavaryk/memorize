//
//  memorizeApp.swift
//  memorize
//
//  Created by Slava Rykov on 08.11.2022.
//

import SwiftUI

@main
struct memorizeApp: App {
    private let GAME = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: GAME)
        }
    }
}
