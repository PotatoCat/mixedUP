//
//  RecipesTableViewController.swift
//  recipes
//
//  Created by Courtney Thomas on 10/30/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import UIKit

var recipeDict: [String:Recipe]  = [:]
var drinkNames: [String] = []

class RecipesTableViewController: UITableViewController
{
    var savedDrinks: MixedData? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createDict()
        drinkNames = Array(recipeDict.keys)
        
        // change to dark theme if it is active
        if(ThemeChanger.theme == "dark"){
            self.view.backgroundColor = ThemeChanger.backgroundDark
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //dictionary that has drink name as key
    //has array as value
    //array has ingredients list, and instructions
    //populates text box from there
   

    func createDict () {
        
        recipeDict["Moscow Mule"] = Recipe.create(drinkName: "Moscow Mule", ingredients: ["1.5 oz. Vodka", "4 oz. Ginger Beer", "Lime Juice"], instructions: ["1. Put  ginger beer, vodka and lime juice in a copper mug", "2. Add 2-3 ice cubes and stir"], imageName: "moscowMule")
        recipeDict["Old Fashioned"] = Recipe.create(drinkName: "Old Fashioned", ingredients: ["2 oz. Bourbon", "1 tsp sugar", "splash of club soda", "4 dashes bitters"], instructions: ["1. Muddle bitters, sugar, orange wheel, cherry, and soda", "2. Remove the orange and fill with ice", "3. Pour in bourbon"], imageName: "oldFashioned")
        recipeDict["Mai Tai"] = Recipe.create(drinkName: "Mai Tai", ingredients: ["1.5 oz. Spiced Rum", "1 oz. Coconut Rum", "1 tsp. Genadine", "3 oz. Pineapple Juice", "2 oz. Orange Juice"], instructions: ["1. Combine all ingredients in a shaker with ice", "2. Shake vigorously and pour into a glass"], imageName: "maiTai")
        recipeDict["Death in the Afternoon"] = Recipe.create(drinkName: "Death in the Afternoon", ingredients: ["1.5 oz. Absinthe", "4 oz. Champagne"], instructions: ["1. Pour absinthe into champagne flute"], imageName: "deathInTheAfternoon")
        recipeDict["Daquiri"] = Recipe.create(drinkName: "Daquiri", ingredients: ["1.5 oz. light rum", ".75 oz. lime juice", ".25 oz. simple syrup"], instructions: ["1. Pour the rum, lime juice, and simple syrup into shaker", "2. Shake well", "3. Strain into a glass"], imageName: "daquiri")
        recipeDict["Tequila Sunrise"] = Recipe.create(drinkName: "Tequila Sunrise", ingredients: ["1.5 oz. Tequila", "4 oz. orange juice", "1 splash grenadine"], instructions: ["1. Add tequila and orange juice to a glass", "2. Float grenadine on top"], imageName: "tequilaSunrise")
        recipeDict["Cherry Collins"] = Recipe.create(drinkName: "Cherry Collins", ingredients: ["2 oz. Cherry Vodka", ".75 oz. Lemon Juice", ".75 oz. Simple Syrup", "Club soda"], instructions: ["1. Add vodka, lemon juice, and simple syrup", "2. Fill with club soda"], imageName: "cherryCollins")
        recipeDict["White Russian"] = Recipe.create(drinkName: "White Russian", ingredients: ["1.5 oz. Vodka", ".75 oz. Coffee Liqueur", ".75 oz. Cream"], instructions: ["1. Pour vodka, coffee liqueur, and cream into a glass", "2. Stir and fill with ice"], imageName: "whiteRussian")
        recipeDict["Irish Coffee"] = Recipe.create(drinkName: "Irish Coffee", ingredients: ["1 cup of Coffee", "1 tbsp. Brown Sugar", "1.5 oz. Whiskey", "Whipped Cream"], instructions: ["1. Add hot coffee and sugar to a mug", "2.Add whiskey and stir", "3. Top with whipped cream"], imageName: "irishCoffee")
        recipeDict["Manhattan"] = Recipe.create(drinkName: "Manhattan", ingredients: ["2 oz. Bourbon", "1 oz. Sweet Vermouth", "3 dashes bitter"], instructions: ["1. Add bourbon and vermouth to a glass with ice", "2. Add bitters and stir"], imageName: "manhattan")
        
        PersistenceService.shared.loadAlcohols()
        print("NUMBER OF DRINKS")
        print(PersistenceService.shared.countDrink())
        print("INSIDE")
        if PersistenceService.shared.listOfAlcohols != nil
        {
            for each in PersistenceService.shared.listOfAlcohols!
            {
                print("INSIDE MORE")
                print(each.alcoholName)
                recipeDict[each.alcoholName] = Recipe.create(drinkName: each.alcoholName, ingredients: each.alcoholList.components(separatedBy: "\n"), instructions: [""], imageName: "mixedUpIcon")
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drinkNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = drinkNames[row]
        // change to dark theme if it is active
        if(ThemeChanger.theme == "dark"){
            cell.backgroundColor = ThemeChanger.backgroundDark
            cell .textLabel?.textColor = ThemeChanger.titleColorDark
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let selected: Recipe = recipeDict[drinkNames[(tableView.indexPathForSelectedRow?.row)!]]!
        let d: RecipeViewController = segue.destination as! RecipeViewController
        d.recipe = selected
        // Pass the selected object to the new view controller.
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
