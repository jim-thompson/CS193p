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
}

let standardTheme1 = CardTheme(name: "move", numberOfPairsToShow: 10, color: Color(.red), emoji: moveEmoji)
let standardTheme2 = CardTheme(name: "eat", numberOfPairsToShow: 10, color: Color(.blue), emoji: eatEmoji)
let standardTheme3 = CardTheme(name: "play", numberOfPairsToShow: 10, color: Color(.green), emoji: playEmoji)

let moveEmoji = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠", "🚁", "🚠", "🛶", "⛵️"]
let eatEmoji = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🍍", "🥥", "🥝", "🍆", "🥑", "🥬", "🥭", "🌶"]
let playEmoji = ["🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🥏", "🎱", "🏓", "🪀", "🪃", "🥅", "🥊", "🥋", "🛹", "🤿", "🛼", "⛳️", "🪁", "🏹"]
