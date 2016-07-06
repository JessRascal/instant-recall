//
//  CreateQuestions.swift
//  instant-recall
//
//  Created by Jess Rascal on 06/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import Foundation

class QuestionSet {
    let table: Int
    
    init(selectedTable: Int) {
        table = selectedTable
    }
    
    func createFactors() -> [Int] {
        var factors = [Int]()
        
        for factor in 1...NUM_OF_TABLES {
            factors.append(factor)
        }
        // Shuffle and return the factors
        factors = factors.shuffle()
        return factors
    }
    
    func createAnswers() -> [Int] {
        var answers = [Int]()
        
        for factor in 1...NUM_OF_TABLES {
            answers.append(factor * table)
        }
        // Shuffle and return the factors
        answers = answers.shuffle()
        return answers
    }
    
    func createValues(answers: Bool? = nil) -> [Int] {
        var values = [Int]()
        
        for factor in 1...NUM_OF_TABLES {
            if answers != nil {
                values.append(factor * table)
            } else {
                values.append(factor)
            }
        }
        // Shuffle and return the factors
        values = values.shuffle()
        return values
    }
}
