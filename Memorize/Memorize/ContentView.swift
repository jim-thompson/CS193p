//
//  ContentView.swift
//  Memorize
//
//  Created by Jim Thompson on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    let emojis1 = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠", "🚁", "🚠", "🛶", "⛵️" ]
    let emojis2 = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🍍", "🥥", "🥝", "🍆", "🥑"]
    let emojis3 = ["🏀", "⚽️", "🏈", "⚾️", "🎾", "🏐", "🥏", "🎱", "🏓", "🪀"]
        
    init()
    {
        // Initialize the current emojis set to set 1
        current_emojis = emojis1
    }
    
    @State var current_emojis: [String]
    
    @State var emoji_count = 24;
    
    var body: some View {
        VStack() {
            Text("Memorize!")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.heavy)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(current_emojis[0..<current_emojis.count], id: \.self) {
                        emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            Spacer()
            HStack() {
                chooseEmojiSet1
                Spacer()
                chooseEmojiSet2
                Spacer()
                chooseEmojiSet3
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var chooseEmojiSet1: some View {
        Button {
            current_emojis = emojis1
            current_emojis.shuffle()
        } label: {
            VStack() {
                Image(systemName: "car.fill,....''''''''''''")
                Text("Move")
                    .font(.headline)
            }
        }
    }
    
    var chooseEmojiSet2: some View {
        Button {
            current_emojis = emojis2
            current_emojis.shuffle()
        } label: {
            VStack() {
                Image(systemName: "applelogo")
                Text("Eat")
                    .font(.headline)
            }
        }
    }
    
    var chooseEmojiSet3: some View {
        Button {
            current_emojis = emojis3
            current_emojis.shuffle()
        } label: {
            VStack() {
                Image(systemName: "play.fill")
                Text("Play")
                    .font(.headline)
            }
        }
    }}

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
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 12 mini"/*@END_MENU_TOKEN@*/)
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 12 mini"/*@END_MENU_TOKEN@*/)
        }
        ContentView()
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
    }
}
