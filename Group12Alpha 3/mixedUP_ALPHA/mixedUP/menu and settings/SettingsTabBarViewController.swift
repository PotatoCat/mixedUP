//
//  SettingsTabBarViewController.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 10/31/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class SettingsTabBarViewController: UITabBarController {

    //var accountInformation:Dictionary = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(accountInformation.keys.first!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "showSettingsAccount"
        //{
            //let vc = segue.destination as! AccountSettingsViewController
            //vc.accountInformation = self.accountInformation
        //}
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 

}
