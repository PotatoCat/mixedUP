//
//  Game.swift
//  KingsCup
//
//  Created by Courtney Thomas on 12/8/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import Foundation


extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
class Card {
    var suit = ""
    var pip = ""
    
    init(suit: String, pip: String) {
        self.suit = suit
        self.pip = pip
    }
    
    class func create(suit Suit: String, pip Pip: String) -> Card {
        return Card(suit: Suit, pip: Pip)
    }
    
    func returnCard() -> String {
        var card = ""
        card += self.pip
        card += self.suit
        return card
    }
}






