//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jim Thompson on 5/19/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
