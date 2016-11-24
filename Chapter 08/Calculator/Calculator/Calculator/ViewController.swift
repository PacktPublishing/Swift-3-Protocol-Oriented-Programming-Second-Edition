//
//  ViewController.swift
//  Calculator
//
//  Created by Jon Hoffman on 12/24/15.
//  Copyright © 2015 Jon Hoffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var display: UILabel!
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func commandEntered(_ sender: UIButton) {
        if let text = display.text, let num = Double(text) {
            var clearDisplay = true
            switch sender.tag {
            case 0:
                calculator.commandEntered(num, nextCommand: nil)
                display.text = "\(calculator.currentValue)"
                clearDisplay = false
            case 1:
                calculator.commandEntered(num, nextCommand: AddCommand())
            case 2:
                calculator.commandEntered(num, nextCommand: SubCommand())
            case 3:
                calculator.commandEntered(num, nextCommand: MultiplyCommand())
            case 4:
                calculator.commandEntered(num, nextCommand: DivideCommand())
            case 5:
                calculator.clear()
            case 6:
                if let text = display.text {
                    let newText = text.substring(to: text.characters.index(before: text.endIndex))
                    display.text = newText
                }
                clearDisplay = false
            default:
                 break
            }
            if clearDisplay {
                display.text = "0"
            }
        }
    }
    
    @IBAction func numberEntered(_ sender: UIButton) {
        if let text = display.text {
            let tag = sender.tag
            if tag < 10 {
                display.text = "\(text)\(tag)"
            } else {
                display.text = "\(text)."
            }
        }
        
    }
}

