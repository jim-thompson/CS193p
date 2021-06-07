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
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack() {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(emojiFont(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(DrawingConstants.matchedOpacity)
                } else {
                    shape.fill()
                }
            }
        })
    }
    
    private func emojiFont(in size: CGSize) -> Font {
        Font.system(size: DrawingConstants.fontScale * min(size.width, size.height))
    }
    
    private struct DrawingConstants {
        static let lineWidth: CGFloat = 3
        static let cornerRadius: CGFloat = 10
        static let matchedOpacity = 0.2
        static let fontScale: CGFloat = 0.8
    }
}
