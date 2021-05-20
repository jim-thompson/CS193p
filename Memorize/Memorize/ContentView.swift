//
//  ContentView.swift
//  Memorize
//
//  Created by Jim Thompson on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠", "🚁", "🚠", "🛶", "⛵️" ]
    @State var emoji_count = 24;
    
    var body: some View {
        VStack() {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emoji_count], id: \.self) {
                        emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            Spacer()
            HStack() {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var add: some View {
        Button {
            if emoji_count < emojis.count {
                emoji_count += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View {
        Button {
            if emoji_count > 1 {
                emoji_count -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
}

struct CardView: View {
    @State var _is_face_up: Bool = true
    let content: String
    
    var body: some View {
        
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if _is_face_up {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            _is_face_up = !_is_face_up
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 12 mini"/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
    }
}
