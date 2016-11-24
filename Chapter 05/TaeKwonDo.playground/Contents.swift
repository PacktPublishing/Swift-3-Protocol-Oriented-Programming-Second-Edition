import UIKit

enum TKDBeltColors: Int {
    case White, Yellow, Orage, Green, Blue, Purple, Red, FirstDegreeBlack, SecondDegreeBlack, ThirdDegreeBlack, ForthDegreeBlack
}

enum TKDColorRank: Int {
    case NoRank, Probationary, Decided, Intermediate, Senior
}

protocol TKDRank {
    var color: TKDBeltColors {get}
    var rank: TKDColorRank {get}
    var passFailTests: [String:Bool] {get set}
}

extension TKDRank {
    mutating func setPassFail(testName: String, pass: Bool) {
        passFailTests[testName] = pass
    }
}


typealias BoardBreak = (name: String, required: Bool)

protocol BoardBreakProtocol {
    var boardBreaks: [BoardBreak] {get}
    var boardBreaksRequired: Int {get}
}

protocol Form {
    var formName: String {get}
}

protocol FocusPad {
    var focusPadDrills: [String] {get}
    var focusPadMissesAllowed: Int {get}
}

protocol OneSteps {
    var oneStepsNumbers: [Int] {get}
}

protocol Sparring {
    var sparringRoundsRequired: Int {get}
}



struct WhiteBelt: TKDRank, Form, OneSteps, FocusPad {
    let color = TKDBeltColors.White
    let rank = TKDColorRank.NoRank
    let formName = "Chon-Ji"
    let oneStepsNumbers = [1,2,3]
    let focusPadDrills = ["Reverse Punch", "Number 1 Front Kick"]
    let focusPadMissesAllowed = 2
    var passFailTests = [String:Bool]()
}

struct GreenBeltSenior: TKDRank, Form, BoardBreakProtocol, FocusPad, Sparring {
    let color = TKDBeltColors.Green
    let rank = TKDColorRank.NoRank
    let formName = "Do-San"
    let focusPadDrills = ["Back Fist", "Number 2 Crescent"]
    let focusPadMissesAllowed = 2
    let boardBreaks = [(name:"Hammer Fist", required: false), (name:"Front Kick", required: false)]
    let boardBreaksRequired = 1
    let sparringRoundsRequired = 2
    var passFailTests = [String:Bool]()
}




var t = WhiteBelt()
t.setPassFail(testName: "Form", pass: true)

if let r = t as? BoardBreak {
    print("Success")
}
