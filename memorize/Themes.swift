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
    
    mutating func addNew(
        themeId: Int,
        name: String,
        contentAmount: Int,
        content: [ThemeContent],
        color: ThemeColor
    ) {
        themes.append(Theme(
            id: themeId,
            name: name,
            contentAmount: contentAmount,
            content: content,
            color: color
        ))
    }
    
    struct Theme: Identifiable {
        let id: Int
        let name: String
        let contentAmount: Int
        let content: [ThemeContent]
        let color: ThemeColor
    }
}
