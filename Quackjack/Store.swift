//
//  Store.swift
//  Quackjack
//
//  Created by Matt Stillwell on 11/28/20.
//

import Foundation

struct Store {
    
    
    struct Keys {
        static let credits = "credits"
        static let allDucks = "allDucks"
        static let myDucks = "myDucks"
    }
    
    
    static func eraseSavedData() -> Void {
        let STARTING_CREDITS: Int = 100
        setCredits(credits: STARTING_CREDITS)
        setMyDucks(ducks: [])
    }
    
    // ==========
    //  CREDITS
    // ==========
    static func getCredits() -> Int {
        let STARTING_CREDITS: Int = 100
        let defaults = UserDefaults.standard
        if let creds = defaults.string(forKey: Keys.credits) {
            print("CREDITS: ", creds) // Some String Value
            return Int(creds)!
        } else {
            return STARTING_CREDITS
        }
    }
    
    static func setCredits(credits: Int) -> Void {
        let defaults = UserDefaults.standard
        defaults.set(credits, forKey: Keys.credits)
    }
    
    
    // =============
    //  ALL DUCKS
    // =============
    static func getAllDucks() -> [Duck] {
        if let savedAllDucks = UserDefaults.standard.value(forKey: Keys.allDucks) as? Data {
             let decoder = JSONDecoder()
             if let loadedAllDucks = try? decoder.decode(Array.self, from: savedAllDucks) as [Duck] {
                return loadedAllDucks
             } else {
                return []
             }
          } else {
             return []
          }
       }

     static func saveAllDucks() {
        let allDucks: [Duck] = [
            Duck(name: "basic duck", cost: 150),
            Duck(name: "cool duck", cost: 300),
            Duck(name: "ninja duck", cost: 500),
            Duck(name: "chef duck", cost: 1000)
        ]
          let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(allDucks){
            UserDefaults.standard.set(encoded, forKey: Keys.allDucks)
          }
     }
    
    
    // =============
    //  MY DUCKS
    // =============
    static func getMyDucks() -> [Duck] {
        if let savedMyDucks = UserDefaults.standard.value(forKey: Keys.myDucks) as? Data {
             let decoder = JSONDecoder()
             if let loadedMyDucks = try? decoder.decode(Array.self, from: savedMyDucks) as [Duck] {
                return loadedMyDucks
             } else {
                return []
             }
          } else {
             return []
          }
       }

    static func addMyDuck(duck: Duck) {
        var myDucks: [Duck] = getMyDucks()
        myDucks.append(duck)
          let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(myDucks){
            UserDefaults.standard.set(encoded, forKey: Keys.myDucks)
          }
     }
    
    static func setMyDucks(ducks: [Duck]) {
          let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(ducks){
            UserDefaults.standard.set(encoded, forKey: Keys.myDucks)
          }
     }
    
    static func hasBeenPurchased(duck: Duck) -> Bool {
        return getMyDucks().map{duck in duck.name}.contains(duck.name)
    }
    
    
}
