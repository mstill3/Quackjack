//
//  App.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/28/20.
//

import SwiftUI


@main
struct QuackjackApp: App {
    static let VERSION = "1.0.1"
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
