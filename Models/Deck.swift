//
//  Deck.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/7/20.
//

import Foundation

class Deck {
    
    var cards: [Card] = []
    
    init() {
        ready()
        shuffle()
    }
    
    func ready() -> Void {

        for valueIndex in 1...13 {
            var value = ""

            if (valueIndex == 1) {
                value = "A"
            } else if (valueIndex == 11) {
                value = "J"
            } else if (valueIndex == 12) {
                value = "Q"
            } else if (valueIndex == 13) {
                value = "K"
            } else {
                value = "\(valueIndex)"
            }
            
            for faceIndex in 1...4 {
                var face = ""
                
                if (faceIndex == 1) {
                    face = "C"
                } else if (faceIndex == 2) {
                    face = "S"
                } else if (faceIndex == 3) {
                    face = "H"
                } else if (faceIndex == 4) {
                    face = "D"
                }
                
                cards.append(Card(value: value, face: face))
            }
        }
    }
        
    func shuffle() -> Void {
        cards.shuffle()
    }
    
    func draw() -> Card {
        if cards.count > 0 {
            return cards.popLast()!
        } else {
            ready()
            shuffle()
            return draw()
        }
    }
    
}
