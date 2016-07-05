//
//  TableSelectionVC.swift
//  instant-recall
//
//  Created by Jess Rascal on 05/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class TableSelectionVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableOptions = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getTableOptions()
    }
    
    func getTableOptions() {
        // Get the different table options.
        for table in 1..<QuestionCollection.questions.count {
            tableOptions.append(table)
        }
        print("Tables: \(tableOptions)") // Debugging
    }
    
    // MARK: - TableView fucntions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableOptionCell") as? TableOptionCell {
            cell.configureCell(tableNum: tableOptions[indexPath.row])
            return cell
        } else {
            return TableOptionCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTable = tableOptions[indexPath.row]
        performSegue(withIdentifier: "goToQuestions", sender: selectedTable)
    }
    
    // MARK: - Segue preparation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToQuestions" {
            if let questionVC = segue.destinationViewController as? QuestionVC {
                if let selectedTable = sender as? Int {
                    questionVC.selectedTable = selectedTable
                }
            }
        }
    }
    
}
