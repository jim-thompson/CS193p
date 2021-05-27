//
//  EmjoiMemoryGame.swift
//  Memorize
//
//  Created by Jim Thompson on 5/26/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐",
                         "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠",
                         "🚁", "🚠", "🛶", "⛵️" ]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
