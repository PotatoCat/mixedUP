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
    
    var bac: Double = 0
    var drinkCount: Int = 0
    var drinksDict: [String:Drinks]  = [:]
    var drinksList: [String] = []
    var pickerSelected = false
    var picked = ""
    //find way to get from database
    var gender: String = "female"
    var weight: Double = 90
    
    
    var startTime = TimeInterval()
    var timer = Timer()
    var hours: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        createDrinksList()
        drinksList = Array(drinksDict.keys)
        // Keyboard Dismissal
        volText?.delegate = self
        proofText?.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func startTime(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate
    }
   
    @IBAction func stopTime(_ sender: Any) {
        timer.invalidate()
        timer == nil
        drinkCount = 0
        numDrinksText.text = String(drinkCount)
        bac = 0
        let bacString = String(format: "%.3f", bac)
        bacText.text = bacString + "%"
    }
    
    @IBAction func addDrink(_ sender: Any) {
        
        if pickerSelected == true {
            let drinkAmount = drinksDict[picked]?.alcAmount
            bacCalculator(amount: drinkAmount!, weight: weight, gender: gender, time: hours)
            let bacString = String(format: "%.3f", bac)
            bacText.text = bacString + "%"
            pickerSelected = false
        }
        else {
            let vol = volText.text
            let volNum = (vol as! NSString).doubleValue
            let proof = proofText.text
            let proofNum = (proof as! NSString).doubleValue
            let drinkAmount = addDrinkAmt(vol: volNum, percent: proofNum)
            bacCalculator(amount: drinkAmount, weight: weight, gender: gender, time: hours)
            let bacString = String(format: "%.3f", bac)
            bacText.text = bacString + "%"
        }
        
        
        drinkCount += 1
        numDrinksText.text = String(drinkCount)
        
        if bac > 0.08 {
            alertText.text = "Your BAC is too high to drive!"
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
        if gender == "female" {
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
    
    // Called when the user touches on the main view (outside the UITextField). Keyboard Dismissal
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

