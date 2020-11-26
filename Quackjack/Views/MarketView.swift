//
//  MarketView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/26/20.
//

import SwiftUI
    
struct MarketView: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
            
                List{
                    Text("duck 1")
                    Text("duck 2")
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
            .offset(x: 0, y: -50)
    
        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}
