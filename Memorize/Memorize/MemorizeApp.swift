//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Jim Thompson on 5/19/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
