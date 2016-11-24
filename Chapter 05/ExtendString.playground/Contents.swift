import UIKit

extension String {
    func getFirstChar() -> Character? {
        guard self.characters.count > 0 else {
            return nil
        }
        return self[startIndex]
    }
    
    subscript (r: CountableClosedRange<Int>) -> String
        {
        get {
            let start = self.index(self.startIndex, offsetBy:r.lowerBound)
            let end = self.index(self.startIndex, offsetBy:r.upperBound)
            return self.substring(with: start..<end)
        }
    }
}

var myString = "This is a test"
print(myString.getFirstChar())

print(myString[3...8])
