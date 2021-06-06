//
//  ContentView.swift
//  Memorize
//
//  Created by Jim Thompson on 5/19/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }.foregroundColor(.red)
        }
        .font(.largeTitle)
        .padding(.horizontal)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
            .previewDevice(/*@START_MENU_TOKEN@*/"iPhone 12 mini"/*@END_MENU_TOKEN@*/)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
            .previewDevice("iPhone 12 mini")
    }
}
