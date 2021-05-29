//
//  EmjoiMemoryGame.swift
//  Memorize
//
//  Created by Jim Thompson on 5/26/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static func createMemoryGame(theme: CardTheme) -> MemoryGame<String> {
        
        // We have a requirement to use all the emoji in the theme (no "dead zones"). A simple way to do this is to shuffle the emoji in the array before created the game. Note that we will still have to shuffle the *cards*.
        
        // We can't shuffle the emoji in place, so we copy them to a variable and then shuffle the variable.
        var emoji = theme.emoji
        emoji.shuffle()
        
        let numberOfCardsInGame = min(emoji.count, theme.numberOfPairsToShow)

        var game = MemoryGame<String>(numberOfPairsOfCards: numberOfCardsInGame) { pairIndex in
            emoji[pairIndex]
        }
        
        // Now we shuffle the cards and then return the game.
        game.shuffle()
        return game
    }
    
    @Published private var model = createMemoryGame(theme: standardTheme1)
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func loadTheme(_ theme: CardTheme) {
        
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
    func selectTheme(name: String) {
        // Find the theme with that name
        
        // Load the theme
    }
}
