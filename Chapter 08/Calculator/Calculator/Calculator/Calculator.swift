//
//  Calculator.swift
//  Calculator
//
//  Created by Jon Hoffman on 12/24/15.
//  Copyright © 2015 Jon Hoffman. All rights reserved.
//

import Foundation

struct Calculator {
    var currentValue: Double = 0.0
    var lastCommand: CommandProtocol?
    
    mutating func clear() {
        currentValue = 0.0
    }
    
    mutating func commandEntered(_ newNumber: Double, nextCommand: CommandProtocol?) {
        if let lastCommand = self.lastCommand {
            self.currentValue = lastCommand.execute(currentValue, secondValue: newNumber)
        } else {
            self.currentValue = newNumber
        }
        lastCommand = nextCommand
    }
}
