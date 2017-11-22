//
//  MixinTableViewCell.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 11/21/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import UIKit

class MixinTableViewCell: UITableViewCell {

    var parentView: MixinSelectTableViewController?

    @IBOutlet weak var mixinNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func selectMixinSwitch(_ sender: UISwitch)
    {
        if (sender.isOn)
        {
            if (!(parentView?.parentView?.possibleList.contains(mixinNameLabel.text!))!)
            {
                print("ADDED Mixin")
                parentView?.parentView?.possibleList.append(mixinNameLabel.text!)
            }
        }
        else
        {
            if (parentView?.parentView?.possibleList.contains(mixinNameLabel.text!))!
            {
                parentView?.parentView?.possibleList = (parentView?.parentView?.possibleList.filter{$0 != mixinNameLabel.text})!
                print("REMOVED Mixin")
            }
        }
        print(parentView?.parentView?.possibleList.description)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
