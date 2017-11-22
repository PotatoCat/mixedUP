//
//  NewDrinkViewController.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 11/21/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class NewDrinkViewController: UIViewController {

    @IBOutlet weak var newNameDrink: UILabel!
    
    var newLabel:String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        newNameDrink.text = newLabel
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
