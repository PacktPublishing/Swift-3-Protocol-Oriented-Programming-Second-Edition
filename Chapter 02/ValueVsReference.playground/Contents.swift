import UIKit

struct MyValueType {
    var name: String
    var assignment: String
    var grade: Int
    
}

class MyReferenceType {
    var name: String
    var assignment: String
    var grade: Int
    
    init(name: String, assignment: String, grade: Int) {
        self.name = name
        self.assignment = assignment
        self.grade = grade
    }
}



func extraCreditReferenceType(ref: MyReferenceType, extraCredit: Int) {
    ref.grade += extraCredit
}

func extraCreditValueType( val: MyValueType, extraCredit: Int) {
    var val = val
    val.grade += extraCredit
}

func newExtraCreditValueType( val: inout MyValueType, extraCredit: Int) {
    val.grade += extraCredit
}


var ref =
    MyReferenceType(name: "Jon", assignment: "Math Test 1", grade: 90)
extraCreditReferenceType(ref: ref, extraCredit:5)
print("Reference: \(ref.name) - \(ref.grade)")

var val =
    MyValueType(name: "Jon", assignment: "Math Test 1", grade: 90)
extraCreditValueType(val: val, extraCredit:5)
print("Value: \(val.name) - \(val.grade)")

var newVal = MyValueType(name: "Jon", assignment: "Math Test 1", grade: 90)
newExtraCreditValueType(val: &newVal, extraCredit:5)
print("Value: \(newVal.name) - \(newVal.grade)")


func getGradeForAssignment(assignment: MyReferenceType) {
    // Code to get grade from DB
    // Random code here to illistrate issue
    let num = Int(arc4random_uniform(20) + 80)
    assignment.grade = num
    print("Grade for \(assignment.name) is \(num)")
}

var mathGrades = [MyReferenceType]()
var students = ["Jon", "Kim", "Kailey", "Kara"]
var mathAssignment = MyReferenceType(name: "", assignment: "Math Assignment", grade: 0)

for student in students {
    mathAssignment.name = student
    getGradeForAssignment(assignment: mathAssignment)
    mathGrades.append(mathAssignment)
}

for assignment in mathGrades {
    print("\(assignment.name): grade \(assignment.grade)")
}

func getGradeForAssignment( assignment: inout MyValueType) {
    // Code to get grade from DB
    // Random code here to illistrate issue
    let num = Int(arc4random_uniform(20) + 80)
    assignment.grade = num
    print("Grade for \(assignment.name) is \(num)")
}

var mathGrades2 = [MyValueType]()
//var students = ["Jon", "Kim", "Kailey", "Kara"]
var mathAssignment2 = MyValueType(name: "", assignment: "Math Assignment", grade: 0)

for student in students {
    mathAssignment2.name = student
    getGradeForAssignment(assignment: &mathAssignment2)
    mathGrades2.append(mathAssignment2)
}

for assignment in mathGrades2 {
    print("\(assignment.name): grade \(assignment.grade)")
}
