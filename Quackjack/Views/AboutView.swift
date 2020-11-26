//
//  AboutView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/11/20.
//

import SwiftUI
    
struct AboutView: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
            
                Image("duck")
                    .resizable()
                    .frame(width: 75, height: 60, alignment: .center)
                
                Text("Quackjack")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                
                Text("This is an app written by Natt Stilwell")
            }
            .offset(x: 0, y: -50)
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
