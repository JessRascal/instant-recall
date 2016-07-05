//
//  DataService.swift
//  instant-recall
//
//  Created by Jess Rascal on 05/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import Foundation
import Firebase

let DB_REF = FIRDatabase.database().reference()

class DataService {
    static let ds = DataService()
    
    private let _REF_QUESTIONS = DB_REF.child("questions")
    private let _REF_TABLES = DB_REF.child("questions").child("table")
    
    var REF_QUESTIONS: FIRDatabaseReference {
        return _REF_QUESTIONS
    }
    
    var REF_TABLES: FIRDatabaseReference {
        return _REF_TABLES
    }
    
//    init() {
//        // Enable disk persistence (offline data access)
//        FIRDatabase.database().persistenceEnabled = true
//        print("Persistence enabled \(FIRDatabase.database().persistenceEnabled)")
//    }
    
}
