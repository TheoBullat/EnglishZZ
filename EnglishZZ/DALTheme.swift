//
//  DALTheme.swift
//  EnglishZZ
//
//  Created by Theo BULLAT on 07/01/2017.
//  Copyright © 2017 Theo BULLAT Loïc GREFFIER. All rights reserved.
//

import Foundation

class DALTheme {
    
    func getThemeAndVocabulary(identifier: String) -> Theme {
        
        var theme: Theme!
        
        switch identifier {
            
        case "School" :
            
            theme = Theme(name: "School", imageName: "School", soundName: "School", soundExtension: "m4a")
            theme.addVocabulary(vocabulary: Vocabulary(name: "Book", imageName: "Book", soundName: "Book", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Pen", imageName: "Pen", soundName: "Pen", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Pencil case", imageName: "PencilCase", soundName: "PencilCase", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "School bag", imageName: "SchoolBag", soundName: "SchoolBag", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Scissors", imageName: "Scissors", soundName: "Scissors", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "School", imageName: "School", soundName: "School", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Glue", imageName: "Glue", soundName: "Glue", soundExtension: "m4a"))
            break
            
        case "Christmas" :
            
            theme = Theme(name: "Christmas", imageName: "SantaClaus", soundName: "Christmas", soundExtension: "m4a")
            theme.addVocabulary(vocabulary: Vocabulary(name: "Bells", imageName: "Bells", soundName: "Bells", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Chimney", imageName: "Chimney", soundName: "Chimney", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Presents", imageName: "Presents", soundName: "Presents", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Santa Claus", imageName: "SantaClaus", soundName: "SantaClaus", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Snowman", imageName: "Snowman", soundName: "Snowman", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Star", imageName: "Star", soundName: "Star", soundExtension: "m4a"))
            theme.addVocabulary(vocabulary: Vocabulary(name: "Christmas Tree", imageName: "ChristmasTree", soundName: "ChristmasTree", soundExtension: "m4a"))
            break
            
        default : break
            
        }
        
        return theme
    }
    
    func getAllThemes() -> [Theme] {
        
        var listTheme = [Theme]()
        
        listTheme.append(Theme(name: "Christmas", imageName: "SantaClaus", soundName: "Christmas", soundExtension: "m4a"))
        listTheme.append(Theme(name: "School", imageName: "School", soundName: "School", soundExtension: "m4a"))
        
        return listTheme
    }
}
