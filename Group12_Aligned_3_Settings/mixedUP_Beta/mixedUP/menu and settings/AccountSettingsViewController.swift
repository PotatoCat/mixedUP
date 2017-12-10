//
//  AccountSettingsViewController.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 10/30/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class AccountSettingsViewController: UIViewController, UITextFieldDelegate {
    
    //@IBOutlet weak var genderText: UILabel!
    //@IBOutlet weak var weightText: UILabel!
    //var accountInformation:Dictionary = [String:String]()
    //var accountInformation2 = [[String:String]]()
    var loggedInAccountInformation: UserData? = nil

    @IBOutlet weak var showUsernameLabel: UILabel!
    @IBOutlet weak var specificGender: UILabel!
    @IBOutlet weak var weightText: UILabel!
    
    var alertController:UIAlertController? = nil
    var weightTextField: UITextField? = nil
    
    var userInformation = [[String: String]]()
    
    //@IBOutlet weak var showActionSheetButton: UIButton!

    /*@IBAction func showActionSheetButtonTapped(_ sender: Any) {
    }*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loggedInAccountInformation = PersistenceService.shared.currentLoggedInUserInfo
        
        if(loggedInAccountInformation != nil)
        {
            showUsernameLabel.text = loggedInAccountInformation?.username
            
            weightTextField?.delegate = self
            
            if(loggedInAccountInformation?.weight != "")
            {
                weightText.text = loggedInAccountInformation?.weight
            }
            if(loggedInAccountInformation?.gender != "")
            {
                specificGender.text = loggedInAccountInformation?.gender
            }
        }
        
        //textField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        //Sets any characters that aren't numbers to "invalid"
        var check:Bool = string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
        if(textField.text!.count > 2 && check)
        {
            textField.deleteBackward()
        }
        //self.checkMaxLength(textField: textField, maxLength: 3)
        return check
    }
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text!.count > maxLength) {
            textField.deleteBackward()
        }
    }
        
        /*if(retrieveDictionary(withKey: "currentUser") != nil){
            accountInformation2 = retrieveDictionary(withKey: "currentUser")!
            accountInformation = accountInformation2[0]
            showUsernameLabel.text = accountInformation.keys.first!
            
            weightTextField?.delegate = self
            
            
            if (retrieveDictionary(withKey: accountInformation.keys.first!) != nil)
            {
                //print("WE HAVE SAVE DATA FOR \(accountInformation.keys.first!)")
                let tempUserData = retrieveDictionary(withKey: accountInformation.keys.first!)
                for userinfo in tempUserData!
                {
                    //print(userinfo)
                    if userinfo.keys.first! == "gender"
                    {
                        specificGender.text = userinfo.values.first!
                    }
                    if userinfo.keys.first! == "weight"
                    {
                        weightText.text = userinfo.values.first!
                    }
                }
        }*/
        /*
        if (accountInformation.keys.first != nil)
        {
            showUsernameLabel.text = accountInformation.keys.first!
            
            if (retrieveDictionary(withKey: accountInformation.keys.first!) != nil)
            {
                print("WE HAVE SAVE DATA FOR \(accountInformation.keys.first!)")
                let tempUserData = retrieveDictionary(withKey: accountInformation.keys.first!)
                for userinfo in tempUserData!
                {
                    print(userinfo)
                    if userinfo.keys.first! == "gender"
                    {
                        specificGender.text = userinfo.values.first!
                    }
                    if userinfo.keys.first! == "weight"
                    {
                        weightText.text = userinfo.values.first!
                    }
                }
                
            }
        }*/
        // Do any additional setup after loading the view.
        //}
        
    //}
    
    override func viewDidAppear(_ animated: Bool) {
        if(loggedInAccountInformation != nil)
        {
            showUsernameLabel.text = loggedInAccountInformation?.username
            
            //weightTextField?.delegate = self
            
            if(loggedInAccountInformation?.weight != "")
            {
                weightText.text = loggedInAccountInformation?.weight
            }
            if(loggedInAccountInformation?.gender != "")
            {
                specificGender.text = loggedInAccountInformation?.gender
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showActionSheetButtonTapped(_ sender: Any) {
        if(loggedInAccountInformation != nil){
            //print(accountInformation.keys.first!)
            // Create the action sheet
            let myActionSheet = UIAlertController(title: "Gender Selection", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            // blue action button
            let blueAction = UIAlertAction(title: "Male", style: UIAlertActionStyle.default) { (action) in
                self.specificGender.text = "Male"
            }
            
            // red action button
            let redAction = UIAlertAction(title: "Female", style: UIAlertActionStyle.default) { (action) in
                self.specificGender.text = "Female"
            }
            
            // yellow action button
            let yellowAction = UIAlertAction(title: "Other", style: UIAlertActionStyle.default) { (action) in
                self.specificGender.text = "Other"
            }
            
            // cancel action button
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
                //print("Cancel action button tapped")
            }
            
            // add action buttons to action sheet
            myActionSheet.addAction(blueAction)
            myActionSheet.addAction(redAction)
            myActionSheet.addAction(yellowAction)
            myActionSheet.addAction(cancelAction)
            
            
            // present the action sheet
            self.present(myActionSheet, animated: true, completion: nil)
        }
        else {
            self.alertController = UIAlertController(title: "Message", message: "You must be logged in to do that", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
        }
    }
    
    @IBAction func weightMenuSelection(_ sender: Any)
    {   if(loggedInAccountInformation != nil){
            self.alertController = UIAlertController(title: "Weight", message: "Please input your current weight", preferredStyle: UIAlertControllerStyle.alert)
        
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) -> Void in
                if (self.weightTextField?.text != nil)
                {
                    self.weightText.text = self.weightTextField?.text
                }
            })
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) -> Void in
                //print("Cancel Button Pressed")
            }
        
            self.alertController!.addAction(ok)
            self.alertController!.addAction(cancel)
        
            self.alertController!.addTextField { (textField) -> Void in
                textField.delegate = self
                // Enter the textfiled customization code here.
                self.weightTextField = textField
                self.weightTextField?.placeholder = "Current Weight"
            }
            present(self.alertController!, animated: true, completion: nil)
        }
        else{
            self.alertController = UIAlertController(title: "Message", message: "You must be logged in to do that", preferredStyle: UIAlertControllerStyle.alert)
        
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
        }
    }
    
    func save(dictionary: [[String: String]], forKey key: String) {
        let archiver = NSKeyedArchiver.archivedData(withRootObject: dictionary)
        UserDefaults.standard.set(archiver, forKey: key)
    }
    
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
    
    @IBAction func saveInformationButton(_ sender: Any) {
        
        if(loggedInAccountInformation != nil)
        {
            if(weightText.text != nil)
            {
                loggedInAccountInformation?.weight = weightText.text!
            }
            if(specificGender.text != nil)
            {
                loggedInAccountInformation?.gender = specificGender.text!
            }
            print(loggedInAccountInformation?.username)
            print(loggedInAccountInformation?.gender)
            print(loggedInAccountInformation?.weight)
            PersistenceService.shared.savePerson(user: loggedInAccountInformation!)
            print(PersistenceService.shared.getPerson(username: (loggedInAccountInformation?.username)!).username)
            print(PersistenceService.shared.getPerson(username: (loggedInAccountInformation?.username)!).gender)
            print(PersistenceService.shared.getPerson(username: (loggedInAccountInformation?.username)!).weight)
            incorrectInfo(messageTitle: "Updated", textMessage: "Your information has been updated!")
        }
        
        /*
        
        
        if(retrieveDictionary(withKey: "currentUser") != nil){
            var tempHolding = [[String:String]]()
            
            
            
            
            
            if (accountInformation.keys.first != nil)
            {
                if (retrieveDictionary(withKey: accountInformation.keys.first!) != nil)
                {
                    tempHolding = retrieveDictionary(withKey: accountInformation.keys.first!)!
                    /*for each in tempHolding
                    {
                        if each.keys.first! == "weight"
                        {
                            each["weight"] = weightText.text!
                        }
                    }*/
                    for i in 0...tempHolding.count-1
                    {
                        if tempHolding[i].keys.first! == "weight"
                        {
                            tempHolding[i]["weight"] = weightText.text!
                        }
                        if tempHolding[i].keys.first! == "gender"
                        {
                            tempHolding[i]["gender"] = specificGender.text!
                        }
                    }
                }
                else
                {
                    tempHolding.append(["weight" : weightText.text!])
                    tempHolding.append(["gender" : specificGender.text!])
                }
                save(dictionary: tempHolding, forKey: accountInformation.keys.first!)
            }
        }
            
        else{
            self.alertController = UIAlertController(title: "Message", message: "You must be logged in to do that", preferredStyle: UIAlertControllerStyle.alert)
            
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
        }*/
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    
    func incorrectInfo(messageTitle: String, textMessage: String) {
        self.alertController = UIAlertController(title: messageTitle, message: textMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) in
            //print("Ok Button Pressed 1");
        }
        self.alertController!.addAction(OKAction)
        
        self.present(self.alertController!, animated: true, completion:nil)
    }
    
    // Called when the user touches on the main view (outside the UITextField).
    //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
