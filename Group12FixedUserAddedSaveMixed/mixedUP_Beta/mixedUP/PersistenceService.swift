//
//  PersistenceService.swift
//  TestCoreData2
//
//  Created by Robert Seitsinger on 10/9/17.
//  Copyright © 2017 Summer Moon Solutions. All rights reserved.
//

import Foundation
import CoreData

class PersistenceService {
    
    // Provide external access to this Singleton.
    static let shared = PersistenceService()
    
    var currentLoggedInUserInfo: UserData? = nil
    
    var listOfAlcohols: [MixedData]? = []
    
    private var userData: [NSManagedObject]!
    private var drinkData: [NSManagedObject]!
    
    // MARK: - Core Data stack
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "mixedUP")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // We want this class to be a Singleton.
    // To keep it that way, don't allow any code outside this class to instantiate an object of this type.
    private init() {}
    
    func count() -> Int {
        return userData.count
    }
    
    func checkAccount(username:String) -> Bool
    {
        for user in userData
        {
            if (user.value(forKey: "username") as! String) == username
            {
                return true
            }
        }
        return false
    }
    
    func checkAccountPassword(password:String) -> Bool
    {
        for user in userData
        {
            if (user.value(forKey: "password") as! String) == password
            {
                return true
            }
        }
        return false
    }
    
    func indexLocation(username:String) -> Int
    {
        var i = 0;
        
        while i < count()
        {
            if (userData[i].value(forKey: "username") as! String) == username
            {
                return i
            }
            i += 1
        }
        return -1
    }
    
    func getPerson(username:String) -> UserData
    {
        if checkAccount(username: username)
        {
            var tempUserInfo = UserData()
            let user = userData[indexLocation(username: username)]
            tempUserInfo.username = user.value(forKey: "username") as! String
            tempUserInfo.password = user.value(forKey: "password") as! String
            tempUserInfo.weight = user.value(forKey: "weight") as! String
            tempUserInfo.gender = user.value(forKey: "gender") as! String
            
            return tempUserInfo
        } else
        {
            return UserData()
        }
    }

    func fetchUsers() {
        
        let managedContext = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"UserData")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        guard let results = fetchedResults else { return }
        
        userData = results
    }
    
    func fetchDrinks() {
        
        let managedContext = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"MixedData")
        
        var fetchedResults:[NSManagedObject]? = nil
        
        do {
            try fetchedResults = managedContext.fetch(fetchRequest) as? [NSManagedObject]
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        guard let results = fetchedResults else { return }
        
        drinkData = results
        
        var i = 0
        
        while i < countDrink()
        {
            var newDrinkAdd = MixedData()
            newDrinkAdd.alcoholName = drinkData[i].value(forKey: "alcoholName") as! String
            newDrinkAdd.alcoholList = drinkData[i].value(forKey: "alcoholList") as! String
            newDrinkAdd.amountList = drinkData[i].value(forKey: "amountList") as! String
            listOfAlcohols?.append(newDrinkAdd)
            i += 1
        }
    }
    
    func loadAlcohols()
    {
        var i = 0
        
        while i < countDrink()
        {
            var newDrinkAdd = MixedData()
            newDrinkAdd.alcoholName = drinkData[i].value(forKey: "alcoholName") as! String
            newDrinkAdd.alcoholList = drinkData[i].value(forKey: "alcoholList") as! String
            newDrinkAdd.amountList = drinkData[i].value(forKey: "amountList") as! String
            //listOfAlcohols?.append(newDrinkAdd)
            print(drinkData[i].value(forKey: "alcoholName") as! String)
            listOfAlcohols?.append(newDrinkAdd)
            i += 1
        }
        print("LOADED")
        print(listOfAlcohols![0].alcoholName)
    }
    
    func savePerson(user: UserData) {
        
        let managedContext = persistentContainer.viewContext
        
        // Create the entity we want to save
        let entity = NSEntityDescription.entity(forEntityName: "UserData", in: managedContext)
        
        let person = NSManagedObject(entity: entity!, insertInto:managedContext)
        
        // Set the attribute values
        person.setValue(user.username, forKey: "username")
        person.setValue(user.password, forKey: "password")
        person.setValue(user.gender, forKey: "gender")
        person.setValue(user.weight, forKey: "weight")
        
        // Commit the changes.
        do {
            try managedContext.save()
            
            if (checkAccount(username: user.username))
            {
                userData.remove(at: indexLocation(username: user.username))
            }
            
            userData.append(person)
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    func saveDrink(drink: MixedData) {
        
        let managedContext = persistentContainer.viewContext
        
        // Create the entity we want to save
        print("!1")
        let entity = NSEntityDescription.entity(forEntityName: "MixedData", in: managedContext)
        
        let mixed = NSManagedObject(entity: entity!, insertInto:managedContext)
        print("!2")

        // Set the attribute values
        mixed.setValue(drink.alcoholName, forKey: "alcoholName")
        mixed.setValue(drink.alcoholList, forKey: "alcoholList")
        mixed.setValue(drink.amountList, forKey: "amountList")
        //mixed.setValue(drink.weight, forKey: "weight")
        print("!3")

        // Commit the changes.
        do {
            try managedContext.save()
            print("!4")

            if (checkDrink(alcohol: drink.alcoholName))
            {
                print("!5")

                drinkData.remove(at: indexLocationDrink(alcoholName: drink.alcoholName))
            }
            print("!6")

            drinkData.append(mixed)
        } catch {
            // what to do if an error occurs?
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    func checkDrink(alcohol:String) -> Bool
    {
        for drink in drinkData
        {
            if (drink.value(forKey: "alcoholName") as! String) == alcohol
            {
                return true
            }
        }
        return false
    }
    
    func indexLocationDrink(alcoholName:String) -> Int
    {
        var i = 0;
        
        while i < countDrink()
        {
            if (drinkData[i].value(forKey: "alcoholName") as! String) == alcoholName
            {
                return i
            }
            i += 1
        }
        return -1
    }
    
    func countDrink() -> Int {
        return drinkData.count
    }
}
