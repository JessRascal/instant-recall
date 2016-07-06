//
//  ResultsVC.swift
//  instant-recall
//
//  Created by Jess Rascal on 06/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    var previousTable = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func restartTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "retryQuestions", sender: nil)
    }
    
    @IBAction func homeTapped(_ sender: AnyObject) {
        performSegue(withIdentifier: "goHome", sender: nil)
    }
    
    // MARK: - Segue preparation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "retryQuestions" {
            if let questionVC = segue.destinationViewController as? QuestionVC {
                questionVC.selectedTable = previousTable
            }
        }
    }

}
