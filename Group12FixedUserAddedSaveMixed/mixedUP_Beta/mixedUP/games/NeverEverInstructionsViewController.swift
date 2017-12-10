//
//  NeverEverInstructionsViewController.swift
//  mixedUP
//
//  Created by Anna Kong on 12/9/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class NeverEverInstructionsViewController: UIViewController {
    
    @IBOutlet weak var instructions: UITextView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        instructions.text = "Participants must sit in a circle, each with a drink. \n\nPlayers will take turns around the circle. Each turn, a player announces something he/she has never done, such as \"Never have I ever eaten dumplings\". \n\nAll players who have eaten dumplings must take a sip of their drink. \n\nThe amount to drink must be predetermined at the beginning of the game. \n\nPress play to get randomly generated suggestions!"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
