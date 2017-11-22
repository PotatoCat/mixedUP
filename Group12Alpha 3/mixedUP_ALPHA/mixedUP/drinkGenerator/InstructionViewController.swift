//
//  InstructionViewController.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 11/19/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController
{
    var alcoholList: [Alcohol] = []
    var juiceList: [Alcohol] = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createJuiceList()
        createAlcoholList()

        // Do any additional setup after loading the view.
    }
    
    func createAlcoholList()
    {
        //var alcoholList: [Alcohol] = []
        
        var tequila = Alcohol(name: "Tequila")
        tequila.nouns.append(contentsOf: ["Mexico", "Desert", "Gold"])
        tequila.adjectives.append(contentsOf: ["Golden","Aged"])
        
        var vodka = Alcohol(name: "Vodka")
        vodka.nouns.append(contentsOf: ["Russia", "Potato"])
        vodka.adjectives.append(contentsOf: ["Clear", "Harsh"])
        
        var whiskey = Alcohol(name: "Whiskey")
        whiskey.adjectives.append(contentsOf: ["Smooth"])
        
        alcoholList.append(tequila)
        alcoholList.append(vodka)
        alcoholList.append(whiskey)
    }
    
    func createJuiceList()
    {
        var pineapple = Alcohol(name: "Pineapple")
        pineapple.adjectives.append(contentsOf: ["Sour", "Prickely", "Hawian"])
        
        var apple = Alcohol(name: "Apple")
        apple.adjectives.append(contentsOf: ["Golden", "Red", "Green", "Baked", "Roasted", "Sweet", "Tart", "Sour"])
        apple.nouns.append(contentsOf: ["Candy"])
        
        juiceList.append(pineapple)
        juiceList.append(apple)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "generateDrinkSegue"
        {
            let vc = segue.destination as! GeneratorViewController
            vc.alcoholList = self.alcoholList
            vc.mixinList = self.juiceList
            //vc.accountInformation = self.accountInformation
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
