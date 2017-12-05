//
//  Drinks.swift
//  DrinkTracker
//
//  Created by Courtney Thomas on 11/20/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import Foundation

class Drinks {
    var drinkName = ""
    var alcAmount: Double = 0.0
    
    init(drinkName: String, alcAmount: Double) {
        self.drinkName = drinkName
        self.alcAmount = alcAmount
    }
    class func create(drinkName DrinkName: String, alcAmount AlcAmount: Double) -> Drinks {
        return Drinks(drinkName: DrinkName, alcAmount: AlcAmount)
    }
    func returnName() -> String {
        return (self.drinkName)
    }
    func returnAlcAmount() -> Double {
        return (self.alcAmount)
    }
}
