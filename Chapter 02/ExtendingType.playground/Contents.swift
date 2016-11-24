import UIKit

extension Int {
    func factorial() -> Int {
        var answer = 1
        for x in (1...self).reversed() {
            answer *= x
        }
        return answer
    }
}

var f = 10
print(f.factorial())
