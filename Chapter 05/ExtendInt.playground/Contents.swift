import UIKit

extension Int {
    func squared() -> Int {
        return self * self
    }
}

var i = 21
print(i.squared())


extension Int {
    var squared1: Int {
        return self * self
    }
}

print(i.squared1)
