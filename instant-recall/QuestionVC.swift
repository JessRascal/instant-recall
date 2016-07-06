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
    
    var answers = [Int]()
    var factors = [Int]()
    var shuffledAnswers = [Int]()
    var shuffledFactors = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the table number label.
        tableNumLabel.text = "\(selectedTable)"
        
        // Create the question and answer set
        createQuestionAndAnswerSet()
        
        // Set the current question and answer
        setCurrentQuestionAndAnswer(factor: questionsAsked)
    }
    
    func createQuestionAndAnswerSet() {
        // Set the factors and answers
        for factor in 1...NUM_OF_TABLES {
            factors.append(factor)
            answers.append(selectedTable * factor)
        }
        
        // Shuffled the factors
        shuffledFactors = factors.shuffle()
    }
    
    func setAnswerOptions() {
        // Shuffle the answers before setting
        shuffledAnswers = answers.shuffle()
        print("Shuffled Answers: \(shuffledAnswers)") // Debugging
        // Set the answer option button labels
        for i in 0..<answerBtns.count {
            answerBtns[i].setTitle(String(shuffledAnswers[i]), for: [])
            answerBtns[i].isEnabled = true
        }
    }
    
    func setCurrentQuestionAndAnswer(factor: Int) {
        questionsAsked += 1
        
        // Set the current factor
        currentFactor = shuffledFactors[factor]
        factorLabel.text = "\(currentFactor)"
        
        // Set the current answer
        currentAnswer = currentFactor * selectedTable
        
        // Set the answer options
        setAnswerOptions()
    }
    
    
    // Answer given
    @IBAction func answerBtnTapped(_ sender: UIButton) {
        
        let answerGiven = Int((sender.titleLabel?.text)!)
        
        guard answerGiven == currentAnswer else {
            // Answer incorrect, disable answer button
            sender.isEnabled = false
            return
        }
        guard questionsAsked < shuffledAnswers.count else {
            // No questions left
            
            // Display results/results screen
            // Using the same sscreen could allow the question
            // elements to be animated away and the
            // components to come in to play
            print("Resutls should be displayed") // Debugging
            return
        }
        // Display the next question
        setCurrentQuestionAndAnswer(factor: questionsAsked)
    }
}
