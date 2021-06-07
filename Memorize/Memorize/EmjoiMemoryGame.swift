//
//  EmjoiMemoryGame.swift
//  Memorize
//
//  Created by Jim Thompson on 5/26/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    var cards: [MemoryGame<String>.Card] {
        return currentGame.cards
    }

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
    
    @Published private(set) var currentGame: MemoryGame<String>
    @Published private(set) var currentTheme: CardTheme!
    
    init() {
        (currentTheme, currentGame) = EmojiMemoryGame.randomMemoryGame()
    }
    
    static func randomMemoryGame() -> (CardTheme, MemoryGame<String>) {
        let theme = CardTheme.all[.random(in: 0..<3)]
        let game = EmojiMemoryGame.createMemoryGame(theme: theme)
        return (theme, game)
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        currentGame.choose(card)
    }
    
    func setNewGame() {
        (currentTheme, currentGame) = EmojiMemoryGame.randomMemoryGame()
    }
}
