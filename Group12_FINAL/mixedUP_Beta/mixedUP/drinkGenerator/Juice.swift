//
//  Juice.swift
//  mixedUP
//
//  Created by Nicholas Frawley on 11/19/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import Foundation

class Juice
{
    fileprivate var _juiceName: String = ""
    fileprivate var _nouns: [String] = []
    fileprivate var _adjectives: [String] = []
    fileprivate var _verbs: [String] = []
    fileprivate var _adverbs: [String] = []
    fileprivate var _descriptors: [String] = []
    fileprivate var _description: String  = ""
    
    var juiceName:String
    {
        get
        {
            return _juiceName
        }
        set (value)
        {
            _juiceName = value
        }
    }
    
    var nouns:[String]
    {
        get
        {
            return _nouns
        }
        set (value)
        {
            _nouns = value
        }
    }
    
    var adjectives:[String]
    {
        get
        {
            return _adjectives
        }
        set (value)
        {
            _adjectives = value
        }
    }
    
    var verbs:[String]
    {
        get
        {
            return _verbs
        }
        set (value)
        {
            _verbs = value
        }
    }
    
    var adverbs:[String]
    {
        get
        {
            return _adverbs
        }
        set (value)
        {
            _adverbs = value
        }
    }
    
    var descriptors:[String]
    {
        get
        {
            return _descriptors
        }
        set (value)
        {
            _descriptors = value
        }
    }
    
    var description:String
    {
        get
        {
            return _description
        }
        set (value)
        {
            _description = value
        }
    }
    
    init(name:String)
    {
        juiceName = name
        descriptors = name.components(separatedBy: " ") //Auto adds part of the name as possible descriptors
    }
}
