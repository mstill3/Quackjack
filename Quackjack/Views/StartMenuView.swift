//
//  StartMenuView.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/9/20.
//

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

enum GAME_STATE {
    case ON_PAGE
    case ON_PLAY_CLICK
    case ON_SETTINGS_CLICK
    case ON_ABOUT_CLICK
}

struct StartMenuView: View {
    
    @State var state: GAME_STATE = GAME_STATE.ON_PAGE

    
    func onPlayButtonPressed() -> Void {
        state = GAME_STATE.ON_PLAY_CLICK
    }

    func onSettingsButtonPressed() -> Void {
        state = GAME_STATE.ON_SETTINGS_CLICK
    }

    func onAboutButtonPressed() -> Void {
        state = GAME_STATE.ON_ABOUT_CLICK
    }
    
    var body: some View {
        Group {
            if (state == GAME_STATE.ON_PAGE) {
               pageBody
            } else if (state == GAME_STATE.ON_PLAY_CLICK) {
                GameView()
            } else if (state == GAME_STATE.ON_SETTINGS_CLICK) {
                SettingsView()
            } else if (state == GAME_STATE.ON_ABOUT_CLICK) {
                AboutView()
            }
        }

    }
    
    var pageBody: some View {
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
                
                
                VStack {

                    
                    
                    Button(action: onPlayButtonPressed,
                        label: {
                            Text("Play")
                        })
                            .buttonStyle(GradientBackgroundStyle())

                        
                        Button(action: onSettingsButtonPressed,
                        label: {
                            Text("Settings")
                        })
                            .buttonStyle(GradientBackgroundStyle())
                        
                        Button(action: onAboutButtonPressed,
                        label: {
                            Text("About")
                        })
                            .buttonStyle(GradientBackgroundStyle())
                        
                    
                
                }
                .padding()

            }
            
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
