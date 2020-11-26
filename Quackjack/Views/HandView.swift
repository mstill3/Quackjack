//
//  HandView.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/5/20.
//

import SwiftUI

struct HandView: View {
    
    @Binding var hand: [Card]
    
    
    func getPoints(hand: [Card]) -> Int {
        return (
            hand
                .filter{!$0.flippedOver}
                .map({$0.getPointValue()})
                .reduce(0, +)
        )
    }
    
    func getNumAces(hand: [Card]) -> Int {
        return (
            hand
                .filter{$0.value == "A"}
                .map({$0.getPointValue()})
                .reduce(0, +)
        )
    }
    
    // TODO use Hand version of this
    func getTotalPointValue() -> Int {
        var totalSum = getPoints(hand: hand)
        let numAces = getNumAces(hand: hand)
        
        if totalSum > 21 && numAces > 0 {
            totalSum -= 10
        }
        return totalSum
    }
    
    var body: some View {
        VStack {
            Text("\(getTotalPointValue())")
                .foregroundColor(.black)
            VStack {
                HStack {
                    Spacer()
                    ForEach(hand) {
                        card in
                            CardView (
                                card: card
                            )
                    }
                    Spacer()
                }
            }
            .frame(width: 350, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.top, 0)
            .padding(.bottom, 10)
        }
    }
}

struct HandView_Previews: PreviewProvider {
    static var previews: some View {
        HandView(hand: Binding.constant([Card(), Card()]))
    }
}
