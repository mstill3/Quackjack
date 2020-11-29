//
//  MarketView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/26/20.
//

import SwiftUI
    
struct MarketView: View {
    
    @State var credits: Int = 100
    @State var marketItems: [Duck] = []
    
    func onMount() {
        credits = Store.getCredits()
        marketItems = Store.getAllDucks()
    }
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
            
            VStack {
            
                List {
                    ForEach(marketItems) { item in
                        MarketItemView(credits: $credits, item: item)
                    }
                }
//                Image("duck")
//                    .resizable()
//                    .frame(width: 75, height: 60, alignment: .center)
//
//                Text("Quackjack")
//                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                    .foregroundColor(.black)
//
//                Text("This is an app written by Natt Stilwell")
            }
            .navigationTitle("Market")
            .toolbar(content: {
                Text("\(credits) credits").fontWeight(.regular)
            })
            .offset(x: 0, y: -50)
    
        }.onAppear {
            onMount()
        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
