//
//  SettingsView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/11/20.
//

import SwiftUI

struct SettingsView: View {
    
    func onClearDataButtonClick() -> Void {
        Store.eraseSavedData()
    }
    
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            VStack {
                List {
                    Text("Version: \(QuackjackApp.VERSION)")
                    Button(action: onClearDataButtonClick,
                    label: {
                        Text("Clear Data")
                    })
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .padding([.leading, .trailing], 20)
                    .background(Color.red.opacity(0.8), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                }
            }
            .navigationTitle("Settings")
            .offset(x: 0, y: -50)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
