//
//  RecipeViewController.swift
//  recipes
//
//  Created by Courtney Thomas on 10/30/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    @IBOutlet weak var ingredientsList: UITextView!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var drinkTitle: UILabel!
    @IBOutlet weak var ingredientTitle: UILabel!
    @IBOutlet weak var procedureTitle: UILabel!
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    
    var recipe = Recipe(drinkName: "", ingredients: [], instructions: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drinkTitle.text = recipe.returnName()
        ingredientsList.text = recipe.returnIngredients()
        instructions.text = recipe.returnInstructions()
        // Do any additional setup after loading the view.
        
        // change to dark theme if it is active
        if(ThemeChanger.theme == "dark"){
            drinkTitle.textColor = ThemeChanger.titleColorDark
            ingredientTitle.textColor = ThemeChanger.titleColorDark
            procedureTitle.textColor = ThemeChanger.titleColorDark
            self.view.backgroundColor = ThemeChanger.backgroundDark
            ingredientsList.backgroundColor = ThemeChanger.backgroundDark
            instructions.backgroundColor = ThemeChanger.backgroundDark
            ingredientsList.textColor = ThemeChanger.textColorDark
            instructions.textColor = ThemeChanger.textColorDark
        }
        else if(ThemeChanger.theme == "light"){
            self.view.backgroundColor = UIColor.white
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /*
    Segmented Control Setting for Theme to be implemented in next release
    @IBAction func themeChangeControl(_ sender: UISegmentedControl) {
        ThemeChanger.theme = themeSegmentedControl.titleForSegment(at: themeSegmentedControl.selectedSegmentIndex)!.lowercased()
        viewDidLoad()
    }
 */

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
