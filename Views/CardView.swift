//
//  Card.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/5/20.
//

import SwiftUI

struct CardView: View {
    
    private let CARD_BACK_COLOR = "blue"
    var card: Card
    
    private func getCard() -> String {
        if (card.flippedOver) {
            return "\(CARD_BACK_COLOR)_back"
        } else {
            return "\(card.value)\(card.face)"
        }
    }
    
    var body: some View {
        Image(getCard())
            .resizable()
            .aspectRatio(0.9, contentMode: .fit)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(card: Card())
            CardView(card: Card(flippedOver: false))
            CardView(card: Card(value: "2", face: "H", flippedOver: false))
        }
        .previewLayout(.fixed(width: 200, height: 200))
    }
}
