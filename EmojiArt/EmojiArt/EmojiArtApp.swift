//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jim Thompson on 6/16/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    let paletteStore = PaletteStore(named: "default")
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentVIew(document: document)
        }
    }
}
