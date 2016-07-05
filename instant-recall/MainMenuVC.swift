//
//  ViewController.swift
//  instant-recall
//
//  Created by Jess Rascal on 04/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit
import Firebase

class MainMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - IBActions
    @IBAction func trainingBtnTapped(sender: AnyObject) {
        performSegue(withIdentifier: "goToTableSelection", sender: nil)
    }

}
