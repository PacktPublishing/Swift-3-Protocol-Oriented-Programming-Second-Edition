//
//  ViewController.swift
//  Delegation
//
//  Created by Jon Hoffman on 11/15/15.
//  Copyright © 2015 Jon Hoffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DisplayNameDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField?
    @IBOutlet weak var lastNameTextField: UITextField?
    @IBOutlet weak var fullNameLabel: UILabel?
    
    var person: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        person = Person(displayNameDelegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        if let first = firstNameTextField?.text, let last = lastNameTextField?.text {
            person?.firstName = first
            person?.lastName = last
        }
    }

    func displayName(_ name: String) {
        fullNameLabel?.text = "\(name)"
    }

}

