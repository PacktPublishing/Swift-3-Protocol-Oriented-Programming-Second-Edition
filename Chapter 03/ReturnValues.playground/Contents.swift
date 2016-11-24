import UIKit

enum DrinkSize {
    case Can12
    case Can16
    case Can24
    case Can32
}

enum DrinkTemperature {
    case TooHot
    case TooCold
    case JustRight
}



struct Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    mutating func drinking(amount: Double) -> Bool {
        guard amount < volume else {
            return false
        }
        volume -= amount
        return true
    }
    mutating func temperatureChange(change: Double) -> DrinkTemperature {
        temperature += change
        guard temperature > 35 else {
            return .TooCold
        }
        guard temperature < 45 else {
            return .TooHot
        }
        return .JustRight
    }
}


var myDrink = Drink(volume: 23.5, caffeine: 280,
    temperature: 38.2, drinkSize: DrinkSize.Can24,
    description: "Drink Structure")

if myDrink.drinking(amount: 50.0) {
    print("Had a drink")
} else {
    print("Error")
}

var results = myDrink.temperatureChange(change: -5)
switch results {
case .TooHot:
    print("Drink too hot")
case .TooCold:
    print("Drink too cold")
case .JustRight:
    print("Drink just right")
}
