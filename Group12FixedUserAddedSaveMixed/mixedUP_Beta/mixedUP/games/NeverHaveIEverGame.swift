//
//  NeverHaveIEverGame.swift
//  mixedUP
//
//  Created by Anna Kong on 12/9/17.
//  Copyright © 2017 Nicholas Frawley. All rights reserved.
//

import Foundation

class NeverHaveIEverGame {
    
    
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
        questions.append("smoked weed")
        questions.append("finished an entire jawbreaker")
        questions.append("kissed someone on the first date")
        questions.append("skipped class")
        questions.append("been in handcuffs")
        questions.append("done something I regret")
        questions.append("been blackout drunk")
        questions.append("bullied someone")
        questions.append("hit someone")
        questions.append("cheated on someone")
        questions.append("cheated in school")
        questions.append("been arrested")
        questions.append("asked someone out")
        questions.append("had surgery")
        questions.append("stolen something")
        questions.append("gone to jail")
    }
    
    func randomValueBetween(min:UInt32, max:UInt32) -> UInt32 {
        var randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
        return randomValue
    }
    
}
