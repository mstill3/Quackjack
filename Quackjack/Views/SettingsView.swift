//
//  SettingsView.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/11/20.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("settings")
            List{
                Text("setting 1")
                Text("setting 2")
            }
        }
        .navigationTitle("Settings")
        .offset(x: 0, y: -50)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
