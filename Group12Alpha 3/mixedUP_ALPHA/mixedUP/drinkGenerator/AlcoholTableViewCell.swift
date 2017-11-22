//
//  AlcoholTableViewCell.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 11/19/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class AlcoholTableViewCell: UITableViewCell {

    //var possibleList = [String]()
    var parentView: AlcoholSelectTableViewController?
    
    @IBOutlet weak var alcoholName: UILabel!
    
    @IBAction func toUseAlcohol(_ sender: UISwitch)
    {
        if (sender.isOn)
        {
            if (!(parentView?.parentView?.possibleList.contains(alcoholName.text!))!)
            {
                print("ADDED ALCOHOL")
                parentView?.parentView?.possibleList.append(alcoholName.text!)
            }
        }
        else
        {
            if (parentView?.parentView?.possibleList.contains(alcoholName.text!))!
            {
                parentView?.parentView?.possibleList = (parentView?.parentView?.possibleList.filter{$0 != alcoholName.text})!
                print("REMOVED ALCOHOL")
            }
        }
        print(parentView?.parentView?.possibleList.description)
    }
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
