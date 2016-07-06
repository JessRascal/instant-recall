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
    var questionSet: QuestionSet!
    var answers = [Int]()
    var factors = [Int]()
    
    var currentFactor: Int = 0
    var currentAnswer: Int = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a question set instance
        questionSet = QuestionSet(selectedTable: selectedTable)
        
        // Set the table number label
        tableNumLabel.text = "\(selectedTable)"
        
        // Create the questions
        createQuestions()
        
        // Set the current question and answer
        setCurrentQuestionAndAnswer(factor: questionsAsked)
    }
    
    func createQuestions() {
        // Create the factors
//        factors = questionSet.createFactors()
        factors = questionSet.createValues()
        
        // Create the answers
//        answers = questionSet.createAnswers()
        answers = questionSet.createValues(answers: true)
    }
    
    func setAnswerOptions() {
        // Shuffle the answers before setting
        answers = answers.shuffle()
        
        // Set the answer option button labels
        for i in 0..<answerBtns.count {
            answerBtns[i].setTitle(String(answers[i]), for: [])
            answerBtns[i].isEnabled = true
        }
    }
    
    func setCurrentQuestionAndAnswer(factor: Int) {
        // Increment the num questions asked
        questionsAsked += 1
        
        // Set the current factor
        currentFactor = factors[factor]
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
        guard questionsAsked < answers.count else {
            // No questions left
            
            // Display results/results screen
            // Using the same sscreen could allow the question
            // elements to be animated away and the
            // components to come in to play
            print("Results should be displayed") // Debugging
            return
        }
        // Display the next question
        setCurrentQuestionAndAnswer(factor: questionsAsked)
    }
}
