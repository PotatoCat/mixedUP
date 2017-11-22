//
//  GeneratorViewController.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 11/19/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class GeneratorViewController: UIViewController

{
    var alcoholList: [Alcohol] = []
    var mixinList: [Alcohol] = []
    //var juiceList: [Alcohol] = []
    
    var possibleList: [String] = []
    
    @IBOutlet weak var numberShots: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        print("LIST")
        print(possibleList.description)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        numberShots.text = String(Int(sender.value))
    }
    override func viewDidAppear(_ animated: Bool) {
        print("LIST")
        print(possibleList.description)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickGenerateDrink(_ sender: Any)
    {
        var twoWordName: [String] = ["Adjective", "Noun"]
        
        var threeWordName: [String] = ["Noun", "Adjective", "Noun"]
        
        var possibleCombinations:[[String]] = [twoWordName,threeWordName]
        
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "alcoholListTable"
        {
            let vc = segue.destination as! AlcoholSelectTableViewController
            vc.alcoholList = self.alcoholList
            //vc.possibleList = self.possibleList
            vc.parentView = self
            //vc.juiceList = self.juiceList
            //vc.accountInformation = self.accountInformation
        }
        if segue.identifier == "mixinListTable"
        {
            //print(mixinList.description)
            let vc = segue.destination as! MixinSelectTableViewController
            vc.mixinList = self.mixinList
            //vc.possibleList = self.possibleList
            vc.parentView = self
            //vc.juiceList = self.juiceList
            //vc.accountInformation = self.accountInformation
        }
        
    }
    

}
