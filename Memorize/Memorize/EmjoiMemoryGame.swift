//
//  EmjoiMemoryGame.swift
//  Memorize
//
//  Created by Jim Thompson on 5/26/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐",
                         "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠",
                         "🚁", "🚠", "🛶", "⛵️" ]

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
