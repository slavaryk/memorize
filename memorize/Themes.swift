//
//  Themes.swift
//  memorize
//
//  Created by Slava Rykov on 25.02.2023.
//

struct Themes<ThemeContent, ThemeColor> {
    private(set) var themes: [Theme] = []
    private(set) var chosenTheme: Theme?
    
    var chosenThemeContent: [ThemeContent] {
        chosenTheme?.content ?? []
    }
    
    mutating func chooseRandomTheme() {
        chosenTheme = themes.randomElement()!
    }
    
    mutating func addNew(name: String, contentCount: Int, content: [ThemeContent], color: ThemeColor) {
        themes.append(Theme(
            name: name,
            contentCount: contentCount,
            content: content,
            color: color
        ))
    }
    
    struct Theme {
        let name: String
        let contentCount: Int
        let content: [ThemeContent]
        let color: ThemeColor
    }
}
