//
//  ContentView.swift
//  Memorize
//
//  Created by Jim Thompson on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                let name = viewModel.currentTheme.name
                Text("Theme: \(name)")
                .padding(.leading, 20.0)
                Spacer()
                let score = viewModel.currentGame.score
                Text("Score: \(score)")
                .padding(.trailing, 20.0)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }.foregroundColor(.red)
            }
            .font(.largeTitle)
            .padding(.horizontal)
            HStack {
                Button {
                    print("New Game")
                    viewModel.setNewGame()
                } label: {
                    Text("New Game")
                        .font(.title)
                }
            }
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0.2)
            } else {
                shape.fill()
            }
        }
    }
}
