//
//  StartMenuView.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/9/20.
//

import SwiftUI

extension Text {
    func withActionButtonStyles() -> some View {
        self.foregroundColor(.white)
            .font(Font.body.bold())
            .padding(10)
            .padding(.horizontal, 20)
            .background(Color.blue)
            .cornerRadius(10)
    }
}

func onMount() {
    Store.saveAllDucks()
}

struct StartMenuView: View {
    var body: some View {
        NavigationView {
            ZStack {

                VStack {
    
                    Image("duck")
                        .resizable()
                        .frame(width: 75, height: 60, alignment: .center)
    
                    Text("Quackjack")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
    
                    VStack {
    
                        NavigationLink(destination: GameView()) {
                            Text("Play")
                                .withActionButtonStyles()
                        }
                        NavigationLink(destination: MarketView()) {
                            Text("Market")
                                .withActionButtonStyles()
                        }
                        NavigationLink(destination: GalleryView()) {
                            Text("My Gallery")
                                .withActionButtonStyles()
                        }
    
                    }
                    .padding()
                    .toolbar {
                       ToolbarItem(placement: .navigationBarLeading) {
                           HStack {
                            NavigationLink(destination: AboutView()) {
                                Text("Info")
                            }
                        }}
                       
                        ToolbarItem(placement: .navigationBarTrailing) {
                            HStack {
                             NavigationLink(destination: SettingsView()) {
                                 Text("Settings")
                             }
                        }}
                   }
    
                }
    
            }
            .offset(x: 0, y: -50)

        }.onAppear {
            onMount()
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
