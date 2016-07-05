//
//  QuestionVC.swift
//  instant-recall
//
//  Created by Jess Rascal on 05/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet weak var factorLabel: UILabel!
    @IBOutlet weak var tableNumLabel: UILabel!
    
    @IBOutlet var answerBtns: [UIButton]!
    
    
    var selectedTable = 0
    var questionsWithAnswers = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the questions and answers for the selected table
        questionsWithAnswers = QuestionCollection.questions[selectedTable]
        print("Questions with answers: \(questionsWithAnswers)")
        // Set the question labels
        factorLabel.text = "\(questionsWithAnswers[0])"
        tableNumLabel.text = "\(selectedTable)"
        
        // Set the answer button labels
        setAnswers()
    }
    
    func setAnswers() {
//        for answer in 1...questionsWithAnswers.count {
        for btn in 0..<answerBtns.count {
            let answer = btn + 1
            answerBtns[btn].setTitle(String(questionsWithAnswers[answer]), for: [])
//            print("\(answerBtns[answer].titleLabel)")
        }
    }
    
    func checkAnswer() {
        // when button pressed, compare its label's value to the correct answer
        // perform accordingly depending on if the answer is right or wrong
        // If wrong answer, disable selected button (sender: UIButton)
        // If right, display next question and re-enable any disabled buttons
    }
    
    
}
