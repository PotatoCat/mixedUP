//
//  ViewController.swift
//  KingsCup
//
//  Created by Courtney Thomas on 12/7/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var instructions: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        instructions.text = "1. Click draw card to choose a card\n\n 2. Depending on what the value of the card is, follow the action\n\n 3. If you lose then you have to finish a full drink\n\n Card actions:\n 'Two is You': The person who drew the card picks someone to drink.\n\n 'Three is Me': The person who drew the card has to drink.\n\n 'Four is Girls': All the girls in the group have to drink.\n\n 'Five is Drive': The person who loses the drive game has to drink.\n\n 'Six is Guys': All the guys have to drink.\n\n 'Seven is Heaven': Everyone raises their hands and the last one to do so has to drink.\n\n 'Eight is Date': The person who drew the card picks someone who has to drink every time they do.\n\n 'Nine is Rhyme': The person who drew the card says a word and  everyone in the circle says a word that rhymes with it. The person who is not able to has to drink.\n\n 'Ten is Categories': The person who drew the card comes up with a category and everyone is the circle says a word that is within the category (i.e. animals). The person who is not able to has to drink.\n\n 'Ace is Waterfall': Starting with the person who drew the card, everyone start drinking until the person before you stops.\n\n 'Jack is Back': The person before the one who drew the card has to drink.\n\n 'Queen is Question Master': Everyone must speak to the person who drew this card in questions and whoever does not has to drink.\n\n 'King is Rule Maker': The person who drew the card makes a rule that if anyone fails to do, they have to drink. It starts over on every king draw."
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    

}

