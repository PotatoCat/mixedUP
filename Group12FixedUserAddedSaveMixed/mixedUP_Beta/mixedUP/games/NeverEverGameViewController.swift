//
//  NeverEverGameViewController.swift
//  mixedUP
//
//  Created by Anna Kong on 12/9/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class NeverEverGameViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    var neverEverGame = NeverHaveIEverGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = "Press Play to generate a question!"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        questionText.text = neverEverGame.getRandomQuestion()
    }
    
}
