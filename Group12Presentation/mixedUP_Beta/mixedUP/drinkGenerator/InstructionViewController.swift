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
        whiskey.nouns.append(contentsOf: ["Whiskey"])
        whiskey.adjectives.append(contentsOf: ["Smooth"])
        
        var baileys = Alcohol(name: "Irish Whiskey (Baileys Irish Cream)")
        baileys.nouns.append(contentsOf: ["Whiskey", "Ireland"])
        baileys.adjectives.append(contentsOf: ["Smooth", "Irish", "Cream", "Milky"])
        
        var gin = Alcohol(name: "Gin")
        gin.nouns.append(contentsOf: ["Gin", "Juniper"])
        gin.adjectives.append(contentsOf: ["Ginger", "Citrus", "Coriander", "Cinnamon"])
        
        var bourben = Alcohol(name: "American Whiskey (Bourbon)")
        bourben.nouns.append(contentsOf: ["Bourbon", "Corn", "Wood"])
        bourben.adjectives.append(contentsOf: ["Wooden", "Barrel Aged", "Caramel", "Vanilla", "Honey", "Sweet"])
        
        var scotch = Alcohol(name: "Scotch")
        scotch.nouns.append(contentsOf: ["Scotch", "Smoke"])
        scotch.adjectives.append(contentsOf: ["Smoked", "Malty", "Nutty"])
        
        var schnappsPeach = Alcohol(name: "Schnapps (Peach)")
        schnappsPeach.nouns.append(contentsOf: ["Peach"])
        schnappsPeach.adjectives.append(contentsOf: ["Peachy", "Fuzzy", "Sweet"])
        
        alcoholList.append(tequila)
        alcoholList.append(vodka)
        alcoholList.append(whiskey)
        alcoholList.append(baileys)
        alcoholList.append(gin)
        alcoholList.append(bourben)
        
        alcoholList.sort{$0.alcoholName < $1.alcoholName}
    }
    
    func createJuiceList()
    {
        var pineapple = Alcohol(name: "Pineapple")
        pineapple.nouns.append(contentsOf: ["Pine"])
        pineapple.adjectives.append(contentsOf: ["Sour", "Prickely", "Hawaiian"])
        
        var apple = Alcohol(name: "Apple")
        apple.adjectives.append(contentsOf: ["Golden", "Red", "Green", "Baked", "Roasted", "Sweet", "Tart", "Sour"])
        apple.nouns.append(contentsOf: ["Candy"])
        
        var blackberry = Alcohol(name: "Blackberry")
        blackberry.adjectives.append(contentsOf: ["Earthy", "Dark", "Purple", "Juicy"])
        blackberry.nouns.append(contentsOf: ["Blackberry"])
        
        var orange = Alcohol(name: "Orange")
        orange.adjectives.append(contentsOf: ["Orangey", "Tart", "Sweet", "Juicy", "Citrusy", "Fresh", "Tropical"])
        orange.nouns.append(contentsOf: ["Orange", "Tangerine", "Navel"])
        
        var cranberry = Alcohol(name: "Cranberry")
        cranberry.adjectives.append(contentsOf: ["Sweetened", "Red", "Sweet", "Jelly"])
        cranberry.nouns.append(contentsOf: ["Cranberry"])
        
        juiceList.append(pineapple)
        juiceList.append(apple)
        juiceList.append(orange)
        juiceList.append(cranberry)
        juiceList.append(blackberry)
        
        juiceList.sort{$0.alcoholName < $1.alcoholName}
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
