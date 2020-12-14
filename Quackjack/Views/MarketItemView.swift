//
//  MarketImageView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/26/20.
//

import SwiftUI

struct MarketItemView: View {
    @Binding var credits: Int;
    var item: Duck;
    
    func onPurchaseButtonClick() -> Void {
        Store.addMyDuck(duck: item)
        Store.decrementCredits(num: item.cost)
    }
    
    func hasBeenPurchased() -> Bool {
        return Store.hasBeenPurchased(duck: item)
    }
    
    func notEnoughCredits() -> Bool {
        return credits < item.cost
    }
    
    private func getButtonColor() -> Color {
        if hasBeenPurchased() {
            return Color.green.opacity(0.8)
        } else if notEnoughCredits() {
            return Color.gray.opacity(0.8)
        } else {
            return Color.blue.opacity(0.8)
        }
    }
    
    var body: some View {
        HStack {
            Text(item.name)
            Text("\(item.cost) credits")
            Image(item.image)
                .resizable()
                .frame(width: 75/2, height: 60/2, alignment: .center)
            Button(action: onPurchaseButtonClick,
            label: {
                Text("Buy")
            })
            .disabled(hasBeenPurchased() || notEnoughCredits())
            .foregroundColor(.white)
            .padding(.all, 10)
            .padding([.leading, .trailing], 20)
            .background(getButtonColor(), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(20)
        }
        
    }
}

struct MarketItemView_Previews: PreviewProvider {
    static var previews: some View {
        MarketItemView(credits: Binding.constant(10), item: Duck(name: "duck", cost: 10))
    }
}

