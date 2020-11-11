//
//  BackgroundView.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/7/20.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        // Background
        ZStack {
        Rectangle()
            .foregroundColor(.green)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        Rectangle()
            .foregroundColor(
                Color(
                    red: 100/255,
                    green: 225/255,
                    blue: 100/255
                )
            )
            .frame(
                width: 300,
                height: 2000,
                alignment: .center
            )
            .rotationEffect(
                Angle(
                    degrees: 45
                )
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
