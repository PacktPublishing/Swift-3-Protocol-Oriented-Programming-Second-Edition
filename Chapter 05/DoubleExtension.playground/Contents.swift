import UIKit

extension Double {
    mutating func currencyString() -> String {
        let divisor = pow(10.0, 2.0)
        let num =  (self * divisor).rounded() / divisor
        return "$\(num)"
    }
}

var num = 3.45678
print(num.currencyString())
