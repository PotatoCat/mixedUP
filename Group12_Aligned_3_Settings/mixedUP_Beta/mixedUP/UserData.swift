//
//  UserData.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 10/31/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import Foundation

class UserData
{
    fileprivate var _username: String = ""
    fileprivate var _password: String = ""
    //fileprivate var _lightTheme = true
    fileprivate var _weight: String = ""
    fileprivate var _gender: String = ""
    //fileprivate var _extremeMode = false
    //fileprivate var _points = 0
    //fileprivate var _totalDrinks = 0
    //fileprivate var _elapseTime = 0
    
    var username:String
    {
        get
        {
            return _username
        }
        set (value)
        {
            _username = value
        }
    }
    
    var password:String
    {
        get
        {
            return _password
        }
        set (value)
        {
            _password = value
        }
    }
    
    var gender:String
    {
        get
        {
            return _gender
        }
        set (value)
        {
            _gender = value
        }
    }
    
    var weight:String
    {
        get
        {
            return _weight
        }
        set (value)
        {
            _weight = value
        }
    }
    
    init()
    {
        
    }
}
