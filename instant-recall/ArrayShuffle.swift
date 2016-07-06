//
//  ArrayShuffle.swift
//  instant-recall
//
//  Created by Jess Rascal on 06/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import Foundation

extension Array {
    func shuffle()->Array {
        var arr = self
        let c = UInt32(arr.endIndex)
        for i in 0..<(c-1) {
            let j = arc4random_uniform(c)
            if i != j {
                swap(&arr[Int(i)], &arr[Int(j)])
            }
        }
        return arr
    }
}
