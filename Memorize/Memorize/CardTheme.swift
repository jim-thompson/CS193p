//
//  CardTheme.swift
//  Memorize
//
//  Created by Jim Thompson on 5/28/21.
//

import SwiftUI

struct CardTheme {
    let name: String
    let numberOfPairsToShow: Int
    let color: Color
    let emoji: [String]
    
    static let all = [
        CardTheme(name: "Move", numberOfPairsToShow: 10, color: Color(.red), emoji: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠", "🚁", "🚠", "🛶", "⛵️"]),
        CardTheme(name: "Eat", numberOfPairsToShow: 10, color: Color(.blue), emoji: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🍍", "🥥", "🥝", "🍆", "🥑", "🥬", "🥭", "🌶"]),
        CardTheme(name: "Play", numberOfPairsToShow: 10, color: Color(.green), emoji: ["🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🥏", "🎱", "🏓", "🪀", "🪃", "🥅", "🥊", "🥋", "🛹", "🤿", "🛼", "⛳️", "🪁", "🏹"]),
    ]
}
