//
//  PaletteEditor.swift
//  EmojiArt
//
//  Created by Jim Thompson on 6/21/21.
//

import SwiftUI

struct PaletteEditor: View {
    @Binding var palette: Palette
    
    var body: some View {
        Form {
            TextField("Name", text: $palette.name)
        }
        .frame(minWidth: 300, minHeight: 400)
    }
}

struct PaletteEditor_Previews: PreviewProvider {
    static var previews: some View {
        Text("FIX ME")
        //PaletteEditor()
            .previewLayout(.fixed(width: 300, height: 400  ))
    }
}
