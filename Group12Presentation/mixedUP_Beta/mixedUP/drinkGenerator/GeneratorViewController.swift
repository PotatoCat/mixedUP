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
    var usableList: [String] = []
    var newName: String = ""
    
    @IBOutlet weak var numberShots: UILabel!
    
    @IBOutlet weak var generateButtonThing: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //print("LIST")
        //print(possibleList.description)
        //generateButtonThing.isUserInteractionEnabled = false
        //generateButtonThing.isEnabled = false
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //print("LIST")
        //print(possibleList.description)
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        numberShots.text = String(Int(sender.value))
    }
    override func viewDidAppear(_ animated: Bool) {
        //print("LIST")
        //print(possibleList.description)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickGenerateDrink(_ sender: Any)
    {
        newName = ""
        usableList.removeAll()
        usableList.append(contentsOf: possibleList)
        if possibleList.count == 0
        {
            //generateButtonThing.isEnabled = false
            newName = "Please first select potential drink ingredients on the previous screen."
        }
        
        if (possibleList.count >= 1)
        {
            newName = ""
            var num:Int = Int(numberShots.text!)!
            
            while (num < usableList.count)
            {
                usableList.remove(at: Int(arc4random_uniform(UInt32(usableList.count))))
            }
            
            
            var twoWordName: [String] = ["Adjective", "Noun"]
            
            var threeWordName: [String] = ["Noun", "Adjective", "Noun"]
            
            var possibleCombinations:[[String]] = [twoWordName,threeWordName]
            
            var diceRoll = Int(arc4random_uniform(UInt32(possibleCombinations.count)))
            print(diceRoll)
            var nameFormat:[String] = possibleCombinations[diceRoll]
            
            print(alcoholList.description)
            print(mixinList.description)
            
            for type in nameFormat
            {
                if(type == "Noun")
                {
                    var diceRoll = Int(arc4random_uniform(UInt32(usableList.count-1)))
                    var toUseLiquid = usableList[diceRoll]
                    
                    print("TO USE \(toUseLiquid)")
                    
                    var i = -1
                    var useAlc = true
                    var x = 0
                    
                    for drink in alcoholList
                    {
                        if(drink.alcoholName == toUseLiquid)
                        {
                            i = x
                        }
                        x = x + 1
                    }
                    x = 0
                    if (i == -1)
                    {
                        useAlc = false
                        for drink in mixinList
                        {
                            if(drink.alcoholName == toUseLiquid)
                            {
                                i = x
                            }
                            x = x + 1
                        }
                    }
                    
                    if(useAlc)
                    {
                        print("Value of i = \(i)")
                        diceRoll = Int(arc4random_uniform(UInt32(alcoholList[i].nouns.count)))
                        newName = newName + alcoholList[i].nouns[Int(arc4random_uniform(UInt32(alcoholList[i].nouns.count)))] + " "
                    }
                    else
                    {
                        print("Value of i = \(i)")
                        diceRoll = Int(arc4random_uniform(UInt32(mixinList[i].nouns.count)))
                        newName = newName + mixinList[i].nouns[Int(arc4random_uniform(UInt32(mixinList[i].nouns.count)))] + " "
                    }
                }
                
                if(type == "Adjective")
                {
                    
                    var diceRoll = Int(arc4random_uniform(UInt32(usableList.count)))
                    var toUseLiquid = usableList[diceRoll]
                    print("TO USE \(toUseLiquid)")
                    var i = -1
                    var useAlc = true
                    var x = 0
                    
                    for drink in alcoholList
                    {
                        if(drink.alcoholName == toUseLiquid)
                        {
                            i = x
                        }
                        x = x + 1
                    }
                    x = 0
                    if (i == -1)
                    {
                        useAlc = false
                        for drink in mixinList
                        {
                            if(drink.alcoholName == toUseLiquid)
                            {
                                i = x
                            }
                            x = x + 1
                        }
                    }
                    
                    if(useAlc)
                    {
                        print("Value of i = \(i)")
                        diceRoll = Int(arc4random_uniform(UInt32(alcoholList[i].adjectives.count)))
                        newName = newName + alcoholList[i].adjectives[Int(arc4random_uniform(UInt32(alcoholList[i].adjectives.count)))] + " "
                    }
                    else
                    {
                        print("Value of i = \(i)")
                        diceRoll = Int(arc4random_uniform(UInt32(mixinList[i].adjectives.count)))
                        newName = newName + mixinList[i].adjectives[Int(arc4random_uniform(UInt32(mixinList[i].adjectives.count)))] + " "
                    }
                }
            }
        }
        
        
        print(newName)
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
        if segue.identifier == "finalDrinkSegue"
        {
            let vc = segue.destination as! NewDrinkViewController
            //print(newName)
            //print(vc.testLabel.text)
            vc.numberOfShots = Int(numberShots.text!)!
            vc.listOfLiquid = usableList
            vc.newLabel = newName
            //vc.accountInformation = self.accountInformation
        }
    }
}
