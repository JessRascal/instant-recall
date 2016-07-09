//
//  Header.swift
//  instant-recall
//
//  Created by Jess Rascal on 09/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = ACCENT_A700
        // ADD SHADOW
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Context is the object used for drawing
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(PRIMARY_500.cgColor)
            
            // Create cut out
            // connect path from point to point
            context.moveTo(x: 0, y: frame.size.height) // starting point
            context.addLineTo(x: frame.size.width, y: frame.size.height * 0.55)
            context.addLineTo(x: frame.size.width, y: frame.size.height)
            context.addLineTo(x: 0, y: frame.size.height)
            context.addLineTo(x: 0, y: frame.size.height * 0.9) // end point
            
            // fill in the path
            context.fillPath()
        }
    }

}
