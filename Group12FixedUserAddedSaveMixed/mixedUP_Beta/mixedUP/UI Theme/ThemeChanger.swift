//
//  ThemeChanger.swift
//  recipes
//
//  Created by Anna Kong on 10/31/17.
//  Copyright © 2017 CS329E. All rights reserved.
//

import Foundation
import UIKit

class ThemeChanger{
    
    public static var theme = "dark"
    public static var backgroundDark:UIColor = #colorLiteral(red: 0.2037239075, green: 0.2765243053, blue: 0.3376390338, alpha: 1)
    public static var titleColorDark:UIColor = #colorLiteral(red: 0.912054956, green: 0.8015872836, blue: 0.5197767615, alpha: 1)
    public static var textColorDark:UIColor = #colorLiteral(red: 0.804257606, green: 0.9310080782, blue: 1, alpha: 1)
    
    public static var backgroundLight:UIColor = #colorLiteral(red: 0.804257606, green: 0.9310080782, blue: 1, alpha: 1)
    public static var titleColorLight:UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    public static var textColorLight:UIColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    
    func setTheme(theme: String){
        ThemeChanger.theme = theme
    }
}
    



