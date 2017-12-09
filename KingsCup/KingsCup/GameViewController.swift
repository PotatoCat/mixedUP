//
//  GameViewController.swift
//  KingsCup
//
//  Created by Courtney Thomas on 12/9/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import UIKit
func randomValueBetween(min:UInt32, max:UInt32) -> UInt32 {
    var randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
    return randomValue
}
class GameViewController: UIViewController {
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    var cardList: [Card] = []
    var losingCard = Int(randomValueBetween(min: 1, max: 20))
    var playing: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateDeck()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButton(_ sender: Any) {
        gamePlay()
    }
    @IBAction func startOver(_ sender: Any) {
        playing = true
        losingCard = Int(randomValueBetween(min: 1, max: 20))
        cardList.removeAll()
        generateDeck()
        cardLabel.text = "Card"
        actionLabel.text = "Action"
        
    }
    
    func generateDeck() {
        var index = ""
        for suit in ["C", "D", "H", "S"] {
            for i in 2...10 {
                index = String(i)
                cardList.append(Card(suit: suit, pip: index))
            }
            for face in ["J", "Q", "K", "A"]{
                cardList.append(Card(suit: suit, pip: face))
            }
            cardList.shuffle()
        }
        
    }
    
    func gamePlay () {
        if cardList.isEmpty {
            generateDeck()
        }
        var cardPlayed: Card = cardList[0]

        if cardList.count > 0 {
            cardPlayed = cardList.removeLast()
            cardLabel.text = cardPlayed.returnCard()
            if cardList.count == losingCard {
                actionLabel.text = "You Lose, Finish your Drink"
                playing = false
            }
            if playing == true {
                if cardPlayed.pip == "2" {
                    actionLabel.text = "Two is You"
                }
                else if cardPlayed.pip == "3" {
                    actionLabel.text = "Three is Me"
                }
                else if cardPlayed.pip == "4" {
                    actionLabel.text = "Four is Girls"
                }
                else if cardPlayed.pip == "5" {
                    actionLabel.text = "Five is Drive"
                }
                else if cardPlayed.pip == "6" {
                    actionLabel.text = "Six is Guys"
                }
                else if cardPlayed.pip == "7" {
                    actionLabel.text = "Seven is Heaven"
                }
                else if cardPlayed.pip == "8" {
                    actionLabel.text = "Eight is Date"
                }
                else if cardPlayed.pip == "9" {
                    actionLabel.text = "Nine is Rhyme"
                }
                else if cardPlayed.pip == "10" {
                    actionLabel.text = "10 is Categories"
                }
                else if cardPlayed.pip == "J" {
                    actionLabel.text = "Jack is Back"
                }
                else if cardPlayed.pip == "Q" {
                    actionLabel.text = "Queen is Question Master"
                }
                else if cardPlayed.pip == "K" {
                    actionLabel.text = "King is Make a Rule"
                }
                else if cardPlayed.pip == "A" {
                    actionLabel.text = "Ace is Waterfall"
                }
                
            }
            else {
                actionLabel.text = "You Lose, Finish your Drink"
            }
            
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
