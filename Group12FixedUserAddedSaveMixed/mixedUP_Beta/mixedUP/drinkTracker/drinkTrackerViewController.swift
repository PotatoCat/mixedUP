//
//  ViewController.swift
//  DrinkTracker
//
//  Created by Courtney Thomas on 11/19/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import UIKit

class drinkTrackerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var drinkList: UIPickerView!
    @IBOutlet weak var volText: UITextField!
    @IBOutlet weak var proofText: UITextField!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var numDrinksText: UILabel!
    @IBOutlet weak var timeText: UILabel!
    @IBOutlet weak var bacText: UILabel!
    @IBOutlet weak var alertText: UILabel!
    @IBOutlet weak var genderTextLabel: UILabel!
    @IBOutlet weak var weightTextLabel: UILabel!
    
    var bac: Double = 0
    var drinkCount: Int = 0
    var drinksDict: [String:Drinks]  = [:]
    var drinksList: [String] = []
    var pickerSelected = false
    var picked = ""
    //find way to get from database
    var gender: String = "Female"
    var weight: Double = 90
    var loggedInAccountInformation: UserData? = nil
    var alertController:UIAlertController? = nil
    var defaultVolume : Double = 6.0
    var timerActive: Bool = false

    
    
    var startTime = TimeInterval()
    var timer = Timer()
    var hours: Double = 0.0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loggedInAccountInformation = PersistenceService.shared.currentLoggedInUserInfo
        weightTextLabel.text = "Weight: \(String(weight)) lbs"
        genderTextLabel.text = "Sex: \(gender)"
        createDrinksList()
        drinksList = Array(drinksDict.keys)
        // Keyboard Dismissal
        volText?.delegate = self
        proofText?.delegate = self
        var missingInfo: Bool = false
        var loggedIn: Bool = false
        if(loggedInAccountInformation != nil)
        {
            loggedIn = true
            if(loggedInAccountInformation?.weight != "")
            {
                weight = Double(Int(loggedInAccountInformation!.weight)!)
                weightTextLabel.text = "Weight: \(String(weight)) lbs"
            }
            else
            {
                missingInfo = true
            }
            if(loggedInAccountInformation?.gender != "")
            {
                gender = (loggedInAccountInformation?.gender)!
                genderTextLabel.text = "Sex: \(gender)"
            }
            else
            {
                missingInfo = true
            }
        }
        else
        {
            missingInfo = true
        }
        
        if missingInfo && loggedIn{
            incorrectInfo(messageTitle: "WARNING DEFAULT VALUES USED", textMessage: "Please add your missing information in the settings screen.")
        }
        else if(missingInfo && !loggedIn)
        {
            incorrectInfo(messageTitle: "WARNING DEFAULT VALUES USED", textMessage: "You need to login and set your weight/gender to fully use this feature.")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func startTime(_ sender: Any) {
        timerActive = true
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
        drinkCount = 0
        numDrinksText.text = String(drinkCount)
        bac = 0
        let bacString = String(format: "%.3f", bac)
        bacText.text = bacString + "%"
        
    }
   
    @IBAction func stopTime(_ sender: Any) {
        timer.invalidate()
        //timer = nil
        drinkCount = 0
        numDrinksText.text = String(drinkCount)
        //bac = 0
        //let bacString = String(format: "%.3f", bac)
        //bacText.text = bacString + "%"
        timerActive = false
        updateAlertText()
    }
    
    @IBAction func addDrink(_ sender: Any) {
        
        if(!timerActive){
            incorrectInfo(messageTitle: "Error", textMessage: "Timer not active. Please start the timer first!")
        }
        else if pickerSelected == true {
            let drinkAmount = (drinksDict[picked]?.alcAmount)! * defaultVolume
            bacCalculator(amount: drinkAmount, weight: weight, gender: gender, time: hours)
            let bacString = String(format: "%.3f", bac)
            bacText.text = bacString + "%"
            pickerSelected = false
            drinkCount += 1
        }
        else if(volText.text != "") {
            let vol = volText.text
            let volNum = (vol as! NSString).doubleValue
            let proof = proofText.text
            let proofNum = (proof as! NSString).doubleValue
            
            if(volNum == 0.0 || proofNum == 0){
                incorrectInfo(messageTitle: "Error", textMessage: "Invalid input. Please enter numbers above zero.")
            }
            else{
                let drinkAmount = addDrinkAmt(vol: volNum, percent: proofNum)
                bacCalculator(amount: drinkAmount, weight: weight, gender: gender, time: hours)
                let bacString = String(format: "%.3f", bac)
                bacText.text = bacString + "%"
                drinkCount += 1
            }
        }
        else{
            incorrectInfo(messageTitle: "Error", textMessage: "Please select a drink from the Picker or Input info for a custom drink")
        }
        
        numDrinksText.text = String(drinkCount)
        
        updateAlertTest()

        
    }
    func updateAlertText(){
        if bac > 0.08 {
            alertText.text = "Your estimated BAC is too high to drive!"
            incorrectInfo(messageTitle: "WARNING", textMessage: "Your estimated BAC is too high to drive!")
        }
        else{
            alertText.text = "Low estimated BAC"
        }
    }
    
    @objc func updateTime() {
        var time = Date().timeIntervalSinceReferenceDate - startTime
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        let seconds = Double(time)
        let secondsPrint = UInt8(time)
        time -= TimeInterval(seconds)
        hours = seconds / 3600
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", secondsPrint)
        
        timeText.text = "\(strMinutes):\(strSeconds)"
        
    }
    func addDrinkAmt (vol: Double, percent: Double) -> Double {
        var drinkAmt: Double = 0
        drinkAmt = (vol * (percent/100))
        return drinkAmt
    }
    //note amount in oz, weight in lbs, time in hours
    func bacCalculator (amount: Double, weight: Double, gender: String, time: Double) -> Double {
        if (gender == "Female" || gender == "Other") {
            bac += ((amount * (5.14 / weight) * 0.66) - 0.015 * time)
            return bac
        }
        else {
            bac += ((amount * (5.14 / weight) * 0.73) - 0.015 * time)
            return bac
        }
    }
   
    func createDrinksList () {
        drinksDict["Moscow Mule"] = Drinks.create(drinkName: "Moscow Mule", alcAmount: 0.6)
        drinksDict["Old Fashioned"] = Drinks.create(drinkName: "Old Fashioned", alcAmount: 0.8)
        drinksDict["Mai Tai"] = Drinks.create(drinkName: "Mai Tai", alcAmount: 0.96)
        drinksDict["Death in the Afternoon"] = Drinks.create(drinkName: "Death in the Afternoon", alcAmount: 1.39)
        drinksDict["Daquiri"] = Drinks.create(drinkName: "Daquiri", alcAmount: 0.6)
        drinksDict["Tequila Sunrise"] = Drinks.create(drinkName: "Tequila Sunrise", alcAmount: 0.6)
        drinksDict["Cherry Collins"] = Drinks.create(drinkName: "Cherry Collins", alcAmount: 0.8)
        drinksDict["White Russian"] = Drinks.create(drinkName: "White Russian", alcAmount: 0.75)
        drinksDict["Irish Coffee"] = Drinks.create(drinkName: "Irish Coffee", alcAmount: 0.6)
        drinksDict["Manhattan"] = Drinks.create(drinkName: "Manhattan", alcAmount: 0.95)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return drinksList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return drinksList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelected = true
        picked = drinksList[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let string = drinksList[row]
        if(ThemeChanger.theme == "dark"){
            return NSAttributedString(string: string, attributes: [NSAttributedStringKey.foregroundColor:ThemeChanger.textColorDark])
        }
        else{
            return NSAttributedString(string: string, attributes: [NSAttributedStringKey.foregroundColor:ThemeChanger.textColorLight])
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
    
    // Called when the user touches on the main view (outside the UITextField). Keyboard Dismissal
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

