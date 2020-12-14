//
//  StoreUtils.swift
//  Quackjack
//
//  Created by Matt Stillwell on 12/6/20.
//

import Foundation

struct StoreUtils {

    static func readInt(key: String, defaultAmount: Int? = 0) -> Int {
        if let num = UserDefaults.standard.string(forKey: key) {
            return Int(num)!
        } else {
            return defaultAmount!
        }
    }

    static func saveInt(key: String, value: Int) -> Void {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func readFloat(key: String, defaultAmount: Float? = 0) -> Float {
        if let num = UserDefaults.standard.string(forKey: key) {
            return Float(num)!
        } else {
            return defaultAmount!
        }
    }

    static func saveFloat(key: String, value: Float) -> Void {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func readString(key: String, defaultStr: String? = "") -> String {
        if let str = UserDefaults.standard.string(forKey: key) {
            return str
        } else {
            return defaultStr!
        }
    }

    static func saveString(key: String, value: String) -> Void {
        UserDefaults.standard.set(value, forKey: key)
    }

    static func readDucks(key: String) -> [Duck] {
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

    static func saveDucks(key: String, value: [Duck]) -> Void {
        if let encoded = try? JSONEncoder().encode(value){
          UserDefaults.standard.set(encoded, forKey: key)
        }
    }

}
