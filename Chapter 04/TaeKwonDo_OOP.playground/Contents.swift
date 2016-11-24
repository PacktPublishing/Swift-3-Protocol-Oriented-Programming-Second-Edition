import UIKit

enum TKDBeltColors: Int {
    case White, Yellow, Orage, Green, Blue, Purple, Red, FirstDegreeBlack, SecondDegreeBlack, ThirdDegreeBlack, ForthDegreeBlack
}

enum TKDColorRank: Int {
    case NoRank, Probationary, Decided, Intermediate, Senior
}

typealias BoardBreak = (name: String, required: Bool)

class TKDTestingRequirements {
    var color = TKDBeltColors.White
    var rank = TKDColorRank.NoRank
    var formName = ""
    var focusPadDrills = [String]()
    var focusPadMissesAllowed = 2
    var sparringRoundsRequired = 0
    var boardBreaksRequired = 0
    
    var boardBreaks: [BoardBreak]?
    var oneStepsNumbers: [Int]?
}

class WhiteBelt: TKDTestingRequirements {
    override init () {
        super.init()
        color = TKDBeltColors.White
        rank = TKDColorRank.NoRank
        formName = "Chon-Ji"
        oneStepsNumbers = [1,2,3]
        focusPadDrills = ["Reverse Punch", "Number 1 Front Kick"]
        focusPadMissesAllowed = 2
        boardBreaksRequired = 0
    }
}

class GreenBeltSenior: TKDTestingRequirements {
    override init() {
        super.init()
        color = TKDBeltColors.Green
        rank = TKDColorRank.NoRank
        formName = "Do-San"
        focusPadDrills = ["Back Fist", "Number 2 Crescent"]
        focusPadMissesAllowed = 2
        boardBreaks = [(name:"Hammer Fist", required: false), (name:"Front Kick", required: false)]
        boardBreaksRequired = 1
        sparringRoundsRequired = 2
        oneStepsNumbers = nil
    }
}