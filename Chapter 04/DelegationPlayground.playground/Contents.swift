import UIKit

protocol DisplayNameDelegate {
    func displayName(name: String)
}

struct Person {
    var firstName = "" {
        didSet {
            displayNameDelegate.displayName(name: getFullName())
        }
    }
    var lastName = "" {
        didSet {
            displayNameDelegate.displayName(name: getFullName())
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

struct MyDisplayNameDelegate: DisplayNameDelegate {
    
    func displayName(name: String) {
        print("Name: \(name)")
    }
}

var displayDelegate = MyDisplayNameDelegate()
var person = Person(displayNameDelegate: displayDelegate)

person.firstName = "Jon"
person.lastName = "Hoffman"
