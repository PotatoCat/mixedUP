//
//  Recipe.swift
//  recipes
//
//  Created by Courtney Thomas on 10/31/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import Foundation

class Recipe {
    var drinkName: String = ""
    var ingredients: [String] = []
    var instructions: [String] = []
    var imageName: String = "mixedUp Icon" // default image is the icon
    
    init(drinkName: String, ingredients: [String], instructions: [String], imageName: String) {
        self.drinkName = drinkName
        self.ingredients = ingredients
        self.instructions = instructions
        self.imageName = imageName
    }
    class func create(drinkName DrinkName: String, ingredients Ingredients: [String], instructions Instructions: [String], imageName name : String) -> Recipe {
        return Recipe(drinkName: DrinkName, ingredients: Ingredients, instructions: Instructions, imageName: name)
    }
    
    func returnName() -> String {
        return (self.drinkName)
    }
    func returnIngredients () -> String {
        var ingredientsString = ""
        for i in self.ingredients {
            ingredientsString += i + "\n"
        }
        return (ingredientsString)
    }
    func returnInstructions () -> String {
        var instructionsString = ""
        for i in self.instructions {
            instructionsString += i + "\n"
        }
        return (instructionsString)
    }
    
    func getImageName () -> String{
        return imageName
    }
}
