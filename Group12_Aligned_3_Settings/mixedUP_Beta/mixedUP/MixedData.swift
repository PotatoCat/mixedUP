//
//  MixedData.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 12/9/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import Foundation

class MixedData
{
    fileprivate var _alcoholName: String = ""
    fileprivate var _alcoholIngrdient: String = ""
    fileprivate var _alcoholAmount: String = ""
    
    var alcoholName:String
    {
        get
        {
            return _alcoholName
        }
        set (value)
        {
            _alcoholName = value
        }
    }
    
    var alcoholList:String
    {
        get
        {
            return _alcoholIngrdient
        }
        set (value)
        {
            _alcoholIngrdient = value
        }
    }
    
    var amountList:String
    {
        get
        {
            return _alcoholAmount
        }
        set (value)
        {
            _alcoholAmount = value
        }
    }
}
