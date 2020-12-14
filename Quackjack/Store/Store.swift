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
        
        static let colorMode = "light"
        
        // stats
        static let totalMatchesPlayed = "totalMatchesPlayed"
        static let totalWon = "totalWon"
        static let totalLost = "totalLost"
        static let maxBet = "maxBet"
        static let minBet = "minBet"
        static let averageBet = "averageBet"
    }
    
    
    // ========
    //  UTILS
    // ========
    private static func readInt(key: String, defaultAmount: Int? = 0) -> Int {
        if let num = UserDefaults.standard.string(forKey: key) {
            return Int(num)!
        } else {
            return defaultAmount!
        }
    }
    
    private static func saveInt(key: String, value: Int) -> Void {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    private static func readFloat(key: String, defaultAmount: Float? = 0) -> Float {
        if let num = UserDefaults.standard.string(forKey: key) {
            return Float(num)!
        } else {
            return defaultAmount!
        }
    }
    
    private static func saveFloat(key: String, value: Float) -> Void {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    private static func readString(key: String, defaultStr: String? = "") -> String {
        if let str = UserDefaults.standard.string(forKey: key) {
            return str
        } else {
            return defaultStr!
        }
    }
    
    private static func saveString(key: String, value: String) -> Void {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    private static func readDucks(key: String) -> [Duck] {
        if let savedDucks = UserDefaults.standard.value(forKey: key) as? Data {
             let decoder = JSONDecoder()
             if let loadedDucks = try? decoder.decode(Array.self, from: savedDucks) as [Duck] {
                return loadedDucks
             } else {
                return []
             }
          } else {
             return []
          }
    }
    
    private static func saveDucks(key: String, value: [Duck]) -> Void {
        if let encoded = try? JSONEncoder().encode(value){
          UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    // =======
    //  EXTRA
    // =======
    static func eraseSavedData() -> Void {
        let STARTING_CREDITS: Int = 100
        setCredits(credits: STARTING_CREDITS)
        setMyDucks(ducks: [])
        setTotalMatchesPlayed(matches: 0)
        setTotalWon(credits: 0)
        setTotalLost(credits: 0)
        setAverageBet(avg: 0)
        setMaxBet(max: 0)
        setMinBet(min: 0)
        setColorMode(colorMode: "light")
    }
    
    // ==========
    //  STATS
    // ==========
    static func getTotalLost() -> Int {
        return readInt(key: Keys.totalLost)
    }
    
    static func setTotalLost(credits: Int) -> Void {
        saveInt(key: Keys.totalLost, value: credits)
    }
    
    static func incrementTotalLost(credits: Int) -> Void {
        setTotalLost(credits: getTotalLost() + credits)
    }
    
    static func getTotalWon() -> Int {
        return readInt(key: Keys.totalWon)
    }
    
    static func setTotalWon(credits: Int) -> Void {
        saveInt(key: Keys.totalWon, value: credits)
    }
    
    static func incrementTotalWon(credits: Int) -> Void {
        setTotalWon(credits: getTotalWon() + credits)
    }
    
    static func getTotalMatchesPlayed() -> Int {
        return readInt(key: Keys.totalMatchesPlayed)
    }
    
    static func setTotalMatchesPlayed(matches: Int) -> Void {
        saveInt(key: Keys.totalMatchesPlayed, value: matches)
    }
    
    static func incrementTotalMatchesPlayed() -> Void {
        setTotalMatchesPlayed(matches: getTotalMatchesPlayed() + 1)
    }
    
    static func getMaxBet() -> Int {
        return readInt(key: Keys.maxBet)
    }
    
    static func setMaxBet(max: Int) -> Void {
        saveInt(key: Keys.maxBet, value: max)
    }
    
    static func getMinBet() -> Int {
        return readInt(key: Keys.minBet)
    }
    
    static func setMinBet(min: Int) -> Void {
        saveInt(key: Keys.minBet, value: min)
    }
    
    static func getAverageBet() -> Float {
        return readFloat(key: Keys.averageBet)
    }
    
    static func setAverageBet(avg: Float) -> Void {
        saveFloat(key: Keys.averageBet, value: avg)
    }
    
    // ==========
    //  SETTINGS
    // ==========
    static func getColorMode() -> String {
        return readString(key: Keys.colorMode, defaultStr: "light")
    }
    
    static func setColorMode(colorMode: String) -> Void {
        saveString(key: Keys.colorMode, value: colorMode)
    }
    
    // ==========
    //  CREDITS
    // ==========
    static func getCredits() -> Int {
        return readInt(key: Keys.credits, defaultAmount: 100)
    }
    
    static func incrementCredits(num: Int) -> Void {
        setCredits(credits: getCredits() + num)
    }
    
    static func decrementCredits(num: Int) -> Void {
        var numCredits: Int = getCredits() - num
        if (numCredits < 0) {
            numCredits = 0
        }
        setCredits(credits: numCredits)
    }
    
    static func setCredits(credits: Int) -> Void {
        saveInt(key: Keys.credits, value: credits)
    }
    
    
    // =============
    //  ALL DUCKS
    // =============
    static func getAllDucks() -> [Duck] {
        return readDucks(key: Keys.allDucks)
    }

     static func saveAllDucks() {
        let allDucks: [Duck] = [
            Duck(name: "duck", image: "duck", cost: 150),
            Duck(name: "cool duck", image: "cool_duck", cost: 300),
            Duck(name: "chef duck", image: "chef_duck", cost: 500),
            Duck(name: "alien duck", image: "alien_duck", cost: 1000)
        ]
        saveDucks(key: Keys.allDucks, value: allDucks)
     }
    
    
    // =============
    //  MY DUCKS
    // =============
    static func getMyDucks() -> [Duck] {
        return readDucks(key: Keys.myDucks)
    }

    static func addMyDuck(duck: Duck) {
        var myDucks: [Duck] = getMyDucks()
        myDucks.append(duck)
        saveDucks(key: Keys.myDucks, value: myDucks)
     }
    
    static func setMyDucks(ducks: [Duck]) {
        saveDucks(key: Keys.myDucks, value: ducks)
     }
    
    static func hasBeenPurchased(duck: Duck) -> Bool {
        return getMyDucks().map{duck in duck.name}.contains(duck.name)
    }
    
}
