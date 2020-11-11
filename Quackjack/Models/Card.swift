//
//  Card.swift
//  Blackjack2
//
//  Created by Matt Stillwell on 11/5/20.
//

import Foundation

struct Card: Identifiable {
    var id = UUID()
    var value: String = "2"
    var face: String = "C"
    var flippedOver: Bool = true
    
    // constructor
    init() {
        value = getRandomValue()
        face = getRandomFace()
        flippedOver = true
    }
    
    init(flippedOver: Bool) {
        value = getRandomValue()
        face = getRandomFace()
        self.flippedOver = flippedOver
    }
    
    init(value: String, face: String) {
        self.value = value
        self.face = face
    }
    
    init(value: String, face: String, flippedOver: Bool) {
        self.value = value
        self.face = face
        self.flippedOver = flippedOver
    }
    
    private func getRandomValue() -> String {
        let valueChoice = (1 ... 13).randomElement()!
        var value = ""

        if (valueChoice == 1) {
            value = "A"
        } else if (valueChoice == 11) {
            value = "J"
        } else if (valueChoice == 12) {
            value = "Q"
        } else if (valueChoice == 13) {
            value = "K"
        } else {
            value = "\(valueChoice)"
        }
        
        return value
    }
    
    private func getRandomFace() -> String {
        let faceChoice = (1 ... 4).randomElement()!
        var face = ""
        
        if (faceChoice == 1) {
            face = "C"
        } else if (faceChoice == 2) {
            face = "S"
        } else if (faceChoice == 3) {
            face = "H"
        } else if (faceChoice == 4) {
            face = "D"
        }
        
        return face
    }
    
    func getPointValue() -> Int {
        var points = 0
        if (value == "A") {
            points = 11
        } else if (value == "2") {
            points = 2
        } else if (value == "3") {
            points = 3
        } else if (value == "4") {
            points = 4
        } else if (value == "5") {
            points = 5
        } else if (value == "6") {
            points = 6
        } else if (value == "7") {
            points = 7
        } else if (value == "8") {
            points = 8
        } else if (value == "9") {
            points = 9
        } else if (value == "10") {
            points = 10
        } else if (value == "J") {
            points = 10
        } else if (value == "Q") {
            points = 10
        } else if (value == "K") {
            points = 10
        }
        return points
    }
    
    func equals(card: Card) -> Bool {
        return self.face == card.face && self.value == card.value
    }
}
