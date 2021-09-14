//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Jim Thompson on 6/16/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    @StateObject var document = EmojiArtDocument()
    @StateObject var paletteStore = PaletteStore(named: "default")
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentVIew(document: document)
                .environmentObject(paletteStore)
        }
    }
}
