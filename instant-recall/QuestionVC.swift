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
    
    var selectedTable = 0
    
    override func viewDidLoad() {
        tableNumLabel.text = "\(selectedTable)"
    }
    
    func checkAnswer() {
        // when button pressed, compare its label's value to the correct answer
        // perform accordingly depending on if the answer is right or wrong
        // If wrong answer, disable selected button (sender: UIButton)
        // If right, display next question and re-enable any disabled buttons
    }
    
    
}
