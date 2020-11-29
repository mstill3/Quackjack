//
//  Duck.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/26/20.
//

import Foundation

struct Duck: Identifiable & Hashable & Codable & Decodable {
    var id = UUID()
    var name: String = "basic duck"
    var cost: Int = 0
    var image: String = "duck"
    var unlocked: Bool = false
    
    // constructor
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
    
    // constructor
    init(name: String, image: String, cost: Int) {
        self.name = name
        self.image = image
        self.cost = cost
    }
}
