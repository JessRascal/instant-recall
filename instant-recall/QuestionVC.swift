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
    var currentFactor: Int = 0
    var currentAnswer: Int = 0
    var questionsAsked = 0
    
    // [[<factor>, <answer>]]
    var answers = [[1, 7], [2, 14], [3, 21], [4, 28], [5, 35], [6, 42], [7, 49], [8, 56], [9, 63], [10, 70], [11, 77], [12, 84]] // replace for Firebase data
    var factors = [Int]()
    var shuffledAnswers = [[Int]]()
    var shuffledFactors = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the factors
        for factor in 1...answers.count {
            factors.append(factor)
        }
        
        // Shuffle questions
        shuffledFactors = factors.shuffle()
        print("Shuffled Factors: \(shuffledFactors)") // Debugging
        
        // Set the table number label.
        tableNumLabel.text = "\(selectedTable)"
        
        // Set the current question and answer
        setQuestionAndAnswer(factor: questionsAsked)
        
        // Set the answer option button labels
        setAnswerOptions()
    }
    
    func setQuestionAndAnswer(factor: Int) {
        questionsAsked += 1
        
        // Set the answer options the answers
        setAnswerOptions()
        
        // Set the current factor
        currentFactor = shuffledFactors[factor]
        factorLabel.text = "\(currentFactor)"
//        print("Current Factor: \(currentFactor)") // Debugging
        
        // Set the current answer
        currentAnswer = currentFactor * selectedTable
//        print("Current Answer: \(currentAnswer)") // Debugging
    }
    
    func setAnswerOptions() {
        // Shuffle the answers before setting
        shuffledAnswers = answers.shuffle()
//        print("Shuffled Answers: \(shuffledAnswers)") // Debugging
        for i in 0..<answerBtns.count {
            answerBtns[i].setTitle(String(shuffledAnswers[i][1]), for: [])
            answerBtns[i].isEnabled = true
        }
    }
    
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        
        let answerGiven = Int((sender.titleLabel?.text)!)
        
        guard answerGiven == currentAnswer else {
            // Answer incorrect, disable answer option
            sender.isEnabled = false
            return
        }
        guard questionsAsked < shuffledAnswers.count else {
            // No questions left
            
            // Display results/results screen
            // Using the same sscreen could allow the question
            // elements to be animated away and the
            // components to come in to play
            print("Reutls should be displayed") // Debugging
            return
        }
        // Display the next question
        setQuestionAndAnswer(factor: questionsAsked)
    }
}
