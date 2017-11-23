//
//  StartScreenViewController.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 10/30/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController, UITextFieldDelegate
{
    var alertController:UIAlertController? = nil
    
    var accountInformation:Dictionary = [String:String]()
    
    var loggedInAccountInformation: UserData? = nil
    
    //var accountInformationToSave:UserData

    var loginTextField: UITextField? = nil
    var passwordTextField: UITextField? = nil
    
    var registerLoginTextField: UITextField? = nil
    var registerPasswordTextField: UITextField? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loginTextField?.delegate = self
        passwordTextField?.delegate = self
        registerLoginTextField?.delegate = self
        registerLoginTextField?.delegate = self
        
        PersistenceService.shared.fetchUsers()
        //self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
    }
    
    /*override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func view(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }*/
    
    @IBAction func settingsButton(_ sender: Any)
    {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    @IBAction func loginPopUp(_ sender: Any)
    {
        if(loggedInAccountInformation != nil)
        {
            self.incorrectInfo(messageTitle: "Already Logged In",textMessage: "Please first logout of the current account before logging into another!")
        }
        else
        {
            self.alertController = UIAlertController(title: "Login", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                //print("Ok Button Pressed")
                
                if((self.loginTextField?.text)! != "" && (self.passwordTextField?.text)! != "")
                {
                    if(PersistenceService.shared.checkAccount(username: (self.loginTextField?.text)!))
                    {
                        if(PersistenceService.shared.checkAccountPassword(password: (self.passwordTextField?.text)!))
                        {
                            self.incorrectInfo(messageTitle: "Welcome!", textMessage: "Remeber to drink plenty of water!")
                            self.loggedInAccountInformation = PersistenceService.shared.getPerson(username: (self.loginTextField?.text)!)
                            PersistenceService.shared.currentLoggedInUserInfo = PersistenceService.shared.getPerson(username: (self.loginTextField?.text)!)
                        }
                        self.incorrectInfo(messageTitle: "Account", textMessage: "Either username/password is incorrect!")
                    }
                    else
                    {
                        self.incorrectInfo(messageTitle: "Account", textMessage: "Either username/password is incorrect!")
                    }
                }
                else
                {
                    self.incorrectInfo(messageTitle: "Missing Arguments",textMessage: "Please input both a username/password")
                }
                
                /*let savedAccounts = self.retrieveDictionary(withKey: "UserInfo") // Retrieve
                var accountExists = false
                if((self.loginTextField?.text)! != "" && (self.passwordTextField?.text)! != "")
                {
                    if (savedAccounts != nil)
                    {
                        //print("CHECKING IF ACCOUNT EXISTS")
                        for account in savedAccounts!
                        {
                            //print(account.keys.first!)
                            //print(account.values.first!)
                            if self.loginTextField?.text == account.keys.first!
                            {
                                //print("CORRENT USER")
                                if self.passwordTextField?.text == account.values.first!
                                {
                                    //print("CORRECT PASSWORD")
                                    accountExists = true
                                }
                            }
                        }
                    }
                }
                else
                {
                    self.incorrectInfo(messageTitle: "Missing Arguments",textMessage: "Please input both a username/password")
                }
                
                if(accountExists)
                {
                    self.accountInformation.removeAll()
                    self.accountInformation[(self.loginTextField?.text)!] = self.passwordTextField?.text
                    //self.accountInformation["Password"] = self.passwordTextField?.text
                    self.incorrectInfo(messageTitle: "Welcome \(self.accountInformation.keys.first!)", textMessage: "Have fun and drink responsibly")
                    self.save(dictionary: [[self.accountInformation.keys.first!: (self.passwordTextField?.text)!]], forKey: "currentUser")
                }
                else
                {
                    self.incorrectInfo(messageTitle: "Account", textMessage: "The username/password was incorrect")
                }
                accountExists = false*/
            })
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) -> Void in
                //print("Cancel Button Pressed")
            }
        
            self.alertController!.addAction(ok)
            self.alertController!.addAction(cancel)
        
            self.alertController!.addTextField { (textField) -> Void in
                // Enter the textfiled customization code here.
                self.loginTextField = textField
                self.loginTextField?.placeholder = "User ID"
            }
            self.alertController!.addTextField { (textField) -> Void in
                // Enter the textfiled customization code here.
                self.passwordTextField = textField
                self.passwordTextField?.placeholder = "Password"
                self.passwordTextField?.isSecureTextEntry = true
            }
        
            present(self.alertController!, animated: true, completion: nil)
        }
    }
    
    func incorrectInfo(messageTitle: String, textMessage: String) {
        self.alertController = UIAlertController(title: messageTitle, message: textMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            //print("Ok Button Pressed 1");
        }
        self.alertController!.addAction(OKAction)
        
        self.present(self.alertController!, animated: true, completion:nil)
    }
    
    @IBAction func registerPopUp(_ sender: Any)
    {
        self.alertController = UIAlertController(title: "Register", message: "Create a new Account", preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            
            if((self.registerLoginTextField?.text)! != "" && (self.registerPasswordTextField?.text)! != "")
            {
                if(PersistenceService.shared.checkAccount(username: (self.registerLoginTextField?.text)!))
                {
                    self.incorrectInfo(messageTitle: "Account", textMessage: "An account with that username already exists")
                }
                else
                {
                    var newUser = UserData.init()
                    newUser.username = (self.registerLoginTextField?.text)!
                    newUser.password = (self.registerPasswordTextField?.text)!
                    
                    PersistenceService.shared.savePerson(user: newUser)
                    
                    self.incorrectInfo(messageTitle: "Account", textMessage: "New account register! Welcome!")
                }
            }
            else
            {
                self.incorrectInfo(messageTitle: "Missing Arguments",textMessage: "Please input both a username/password")
                //print("NO INFO ADDED YET")
            }
            //print("Ok Button Pressed")
            /*var savedAccounts = self.retrieveDictionary(withKey: "UserInfo") // Retrieve
            var alreadyExists = false
            if((self.registerLoginTextField?.text)! != "" && (self.registerPasswordTextField?.text)! != "")
            {
                if (savedAccounts != nil)
                {
                    //print("CHECKING IF ACCOUNT EXISTS")
                    for account in savedAccounts!
                    {
                        if self.registerLoginTextField?.text == account.keys.first!
                        {
                            alreadyExists = true
                        }
                    }
                    if (!alreadyExists)
                    {
                        savedAccounts?.append([(self.registerLoginTextField?.text)! : (self.registerPasswordTextField?.text)!])
                        self.save(dictionary: savedAccounts!, forKey: "UserInfo")
                        self.incorrectInfo(messageTitle: "Account", textMessage: "New account register! Welcome!")
                        //print("NEW USER ADDED")
                    }
                    else
                    {
                        //print("USER ALREADY EXISTS")
                        self.incorrectInfo(messageTitle: "Account", textMessage: "An account with that username already exists")
                    }
                }
                else
                {
                    //print("ADDING TO EMPTY DICTIONARY")
                    self.incorrectInfo(messageTitle: "Account", textMessage: "New account register! Welcome!")
                    self.save(dictionary: [[(self.registerLoginTextField?.text)! : (self.registerPasswordTextField?.text)!]], forKey: "UserInfo")
                }
            }
            else
            {
                self.incorrectInfo(messageTitle: "Missing Arguments",textMessage: "Please input both a username/password")
                //print("NO INFO ADDED YET")
            }
            alreadyExists = false*/
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) -> Void in
            //print("Cancel Button Pressed")
        }
        
        self.alertController!.addAction(ok)
        self.alertController!.addAction(cancel)
        
        self.alertController!.addTextField { (textField) -> Void in
            // Enter the textfiled customization code here.
            self.registerLoginTextField = textField
            self.registerLoginTextField?.placeholder = "User ID"
        }
        self.alertController!.addTextField { (textField) -> Void in
            // Enter the textfiled customization code here.
            self.registerPasswordTextField = textField
            self.registerPasswordTextField?.placeholder = "Password"
            self.registerPasswordTextField?.isSecureTextEntry = true
        }
        
        present(self.alertController!, animated: true, completion: nil)
    }
    
    func save(dictionary: [[String: String]], forKey key: String) {
        let archiver = NSKeyedArchiver.archivedData(withRootObject: dictionary)
        UserDefaults.standard.set(archiver, forKey: key)
    }
    
    /*func save(dictionary: [], forKey key: String) {
        let archiver = NSKeyedArchiver.archivedData(withRootObject: dictionary)
        UserDefaults.standard.set(archiver, forKey: key)
    }*/
    
    func retrieveDictionary(withKey key: String) -> [[String: String]]? {
        
        // Check if data exists
        guard let data = UserDefaults.standard.object(forKey: key) else {
            return nil
        }
        
        // Check if retrieved data has correct type
        guard let retrievedData = data as? Data else {
            return nil
        }
        
        // Unarchive data
        let unarchivedObject = NSKeyedUnarchiver.unarchiveObject(with: retrievedData)
        return unarchivedObject as? [[String: String]]
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSettings"
        {
            let vc = segue.destination as! SettingsTabBarViewController
            let accountVC = vc.childViewControllers[1] as! AccountSettingsViewController
            accountVC.loggedInAccountInformation = self.loggedInAccountInformation
            //vc.accountInformation = self.accountInformation
        }
        if segue.identifier == "toNavSegue"
        {
            let vc = segue.destination as! NavMenuViewController
            let menuVC = vc.childViewControllers[0] as! MenuSelectViewController
            menuVC.loggedInAccountInformation = self.loggedInAccountInformation
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        self.loggedInAccountInformation = nil
        PersistenceService.shared.currentLoggedInUserInfo = nil
        incorrectInfo(messageTitle: "Logout", textMessage: "You have logged out")
    }

    // This method is called when the user touches the Return key on the
    // keyboard. The 'textField' passed in is a pointer to the textField
    // the cursor was in at the time they touched the Return key on the
    // keyboard.
    //
    // From the Apple documentation: Asks the delegate if the text field
    // should process the pressing of the return button.
    //
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 'First Responder' is the same as 'input focus'.
        // We are removing input focus from the text field.
        textField.resignFirstResponder()
        return true
    }
    
    // Called when the user touches on the main view (outside the UITextField).
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
