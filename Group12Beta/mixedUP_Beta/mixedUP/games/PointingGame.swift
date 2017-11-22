//
//  PointingGame.swift
//  mixedUP
//
//  Created by Anna Kong on 11/21/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import Foundation

class PointingGame {
    
    var intructions: String = "1. Press the button to generate a question. Let all players know the question. \n\n 2. When everyone is ready and has decided who they will point at, begin a countdown. \n\n 3. When you finish, everyone should point at the same time. \n\n 4. The person with the most people pointing at them needs to drink. Tied players also drink!"
    
    private var questions = [String]()
    
    func addQuestion(question: String){
        questions.append(question)
    }
    
    func count() -> Int {
        return questions.count
    }
    
    func getQuestion(index:Int) -> String {
        guard index < questions.count else { return ""}
        return questions[index]
    }
    
    func getRandomQuestion() -> String {
        return questions[Int(randomValueBetween(min:0, max: UInt32(questions.count-1)))]
    }
    
    init() {
        questions.append("Point at the person who you think is most likely to go to jail.")
        questions.append("Point at the person who you think is most likely to secretly be a serial killer.")
        questions.append("Point at the person who you think would die first in a horror movie.")
        questions.append("Point at the person who you would want to have with you in the Zombie Apocalypse")
        questions.append("Point at the person who you think has the best fashion sense.")
        questions.append("Point at the person who you think is most likely to rule the world.")
        questions.append("Point at the person who you think gives the best hugs")
        questions.append("Point at the person who you think has had the most drinks so far.")
        questions.append("Point at the person who you think needs another drink")
    }
    
    func randomValueBetween(min:UInt32, max:UInt32) -> UInt32 {
        var randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
        return randomValue
    }
    
}
