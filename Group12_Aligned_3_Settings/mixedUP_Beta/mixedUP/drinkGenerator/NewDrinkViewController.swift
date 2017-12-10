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
    
    var listOfLiquid: [String] = []
    var numberOfShots:Int = 0
    var alertController:UIAlertController? = nil
    
    @IBOutlet weak var ingredientsListText: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        newNameDrink.text = newLabel
        
        print(listOfLiquid.description)
        
        var newIngr: String = ""
        
        for ingred in listOfLiquid
        {
            newIngr = newIngr + "\(String(numberOfShots/listOfLiquid.count)) oz. \(ingred)\n"
        }
        
        ingredientsListText.text = newIngr
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func clickToSave(_ sender: Any)
    {
        if(!GeneratorViewController.validDrink){
            //alert unsuccessful save
            incorrectInfo(messageTitle: "Oh no", textMessage: "Not enough ingredients selected! Please go back")
        }
        else{
            // alert successful save
            self.alertController = UIAlertController(title: "Cheers!", message: "Drink saved to Recipes!", preferredStyle: UIAlertControllerStyle.alert)
                
            var newDrink = MixedData()
            newDrink.alcoholName = newNameDrink.text!
            var tempString = ""
            
            for each in listOfLiquid
            {
                tempString.append("\n")
                tempString.append(each)
            }
            print(tempString)
            newDrink.alcoholList = tempString
            newDrink.amountList = ""
            print("CLICKED")
            PersistenceService.shared.saveDrink(drink: newDrink)
            
            /*for each in PersistenceService.shared.listOfAlcohols!
            {
                print(each.alcoholName)
            }*/
        }
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
    
    func incorrectInfo(messageTitle: String, textMessage: String) {
        self.alertController = UIAlertController(title: messageTitle, message: textMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            //print("Ok Button Pressed 1");
        }
        self.alertController!.addAction(OKAction)
        
        self.present(self.alertController!, animated: true, completion:nil)
    }

}
