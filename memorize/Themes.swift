//
//  Themes.swift
//  memorize
//
//  Created by Slava Rykov on 25.02.2023.
//

struct Themes {
    private(set) var themes: [String]
    private(set) var chosenTheme: String?
    
    mutating func chooseRandomTheme() {
        chosenTheme = themes.randomElement()!
    }
    
    mutating func addNew(theme: String) {
        themes.append(theme)
    }
}
