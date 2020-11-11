//
//  Hand.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/8/20.
//

import Foundation

class Hand {
    
    var cards: [Card] = []
    
    var numAces = 0 // to change b/w low/high
    
    init() {

    }
    
    func getTotalPointValue() -> Int {
        return (
            cards
                .filter{!$0.flippedOver}
                .map({$0.getPointValue()}).reduce(0, +)
        )
    }
    
}
