//
//  PointingGameViewController.swift
//  mixedUP
//
//  Created by Anna Kong on 11/21/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class PointingGameViewController: UIViewController {
    
    var pointingGame = PointingGame()
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var instructionsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextView.text = "Press Play to generate a question!"
        instructionsTextView.text = pointingGame.intructions
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playGameButton(_ sender: UIButton) {
        questionTextView.text = pointingGame.getRandomQuestion()
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
