//
//  Person.swift
//  Delegation
//
//  Created by Jon Hoffman on 11/15/15.
//  Copyright © 2015 Jon Hoffman. All rights reserved.
//

import Foundation

struct Person: FullName{
    var firstName = "" {
        didSet {
            displayNameDelegate.displayName(getFullName())
        }
    }
    var lastName = "" {
        didSet {
            displayNameDelegate.displayName(getFullName())
        }
    }
    var displayNameDelegate: DisplayNameDelegate
    
    init(displayNameDelegate: DisplayNameDelegate) {
        self.displayNameDelegate = displayNameDelegate
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
    

}
