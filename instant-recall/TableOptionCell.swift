//
//  TableOptionCell.swift
//  instant-recall
//
//  Created by Jess Rascal on 05/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class TableOptionCell: UITableViewCell {
    
    @IBOutlet weak var optionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(tableNum: Int) {
        optionLabel.text = "\(tableNum) Times Table"
    }

}
