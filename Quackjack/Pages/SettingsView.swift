//
//  SettingsView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/11/20.
//

import SwiftUI

struct SettingsView: View {
    
    @State var totalMatchesPlayed: Int = 0
    @State var totalWon: Int = 0
    @State var totalLost: Int = 0
    @State var averageBet: Float = 0.0
    @State var minBet: Int = 0
    @State var maxBet: Int = 0
    @State var colorMode: String = "light"

    func onMount() {
        setVars()
    }

    func setVars() {
        totalMatchesPlayed = Store.getTotalMatchesPlayed()
        totalWon = Store.getTotalWon()
        totalLost = Store.getTotalLost()
        averageBet = Store.getAverageBet()
        minBet = Store.getMinBet()
        maxBet = Store.getMaxBet()
        colorMode = Store.getColorMode()
    }
    
    func onClearDataButtonClick() -> Void {
        Store.eraseSavedData()
        setVars()
    }
    
    let options = [
        DropdownOption(key: "lightColorMode", val: "Light mode"),         DropdownOption(key: "darkColorMode", val: "Dark mode")
    ]

    let onSelect = { key in
        print(key)
    }
    
    func toggleLightMode() -> Void {
        if (Store.getColorMode() != "light") {
            Store.setColorMode(colorMode: "light")
        }
        colorMode = "light"
    }
    
    func toggleDarkMode() -> Void {
//        if (Store.getColorMode() != "dark") {
//            Store.setColorMode(colorMode: "dark")
//        }
//        colorMode = "dark"
    }
    
    func getTextColor() -> Color {
        return colorMode != "light" ? Color.white : Color.black
    }
    
    func getBackgroundColor() -> Color {
        return colorMode != "light" ? Color.black : Color.white
    }
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(colorMode == "light" ? .white : .black)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

            VStack {
                List {
                    Text("Version: \(QuackjackApp.VERSION)")
                        .foregroundColor(getTextColor())
                        .listRowBackground(getBackgroundColor())
                    
                    Text("Total Matches Played: \(totalMatchesPlayed)")
                        .foregroundColor(getTextColor())
                        .listRowBackground(getBackgroundColor())
                    
                    Text("Total Credits Won: \(totalWon)")
                        .foregroundColor(getTextColor())
                        .listRowBackground(getBackgroundColor())
                    
                    Text("Total Credits Lost: \(totalLost)")                   .foregroundColor(getTextColor())
                        .listRowBackground(getBackgroundColor())
                    
                    Text("Average Bet: \(averageBet)")
                        .foregroundColor(getTextColor())
                        .listRowBackground(getBackgroundColor())
                    
                    Text("Max Bet: \(maxBet)")
                        .foregroundColor(getTextColor())
                        .listRowBackground(getBackgroundColor())
                    
                    Text("Minimum Bet: \(minBet)")
                        .foregroundColor(getTextColor())
                        .listRowBackground(getBackgroundColor())
                    
//                    Drop
                    
//                    DropdownButton(displayText: .constant("Light mode"), options: options, onSelect: onSelect)
                    Button(action: toggleLightMode, label: {
                        Text("Light Mode")
                    })
                    .foregroundColor(getTextColor())
                    .listRowBackground(getBackgroundColor())
                    
                    Button(action: toggleDarkMode, label: {
                        Text("Dark Mode")
                    })
                    .foregroundColor(.gray)
                    .listRowBackground(getBackgroundColor())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    
                    
                    Button(action: onClearDataButtonClick,
                    label: {
                        Text("Clear Data")
                    })
                    .foregroundColor(getTextColor())
                    .listRowBackground(getBackgroundColor())
                    .padding(.all, 10)
                    .padding([.leading, .trailing], 20)
                    .background(Color.red.opacity(0.8), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(20)
                    

                }
                .background(getBackgroundColor())

            }
            .background(getBackgroundColor())
            .navigationTitle("Settings")
            .listRowBackground(getBackgroundColor())
            .offset(x: 0, y: -150)
        }.onAppear {
            onMount()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
