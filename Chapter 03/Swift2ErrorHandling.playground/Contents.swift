import UIKit

enum DrinkSize {
    case Can12
    case Can16
    case Can24
    case Can32
}

enum DrinkErrors3: Error {
    case insufficentVolume
    case tooHot
    case tooCold
}

enum DrinkErrors2: Error {
    case insufficentVolume
    case tempOutOfRange (Description: String)
}

enum DrinkErrors: Error {
    case insufficentVolume
    case tooHot (temp: Double)
    case tooCold (temp: Double)
}

struct Drink {
    var volume: Double
    var caffeine: Double
    var temperature: Double
    var drinkSize: DrinkSize
    var description: String
    
    
    /// This method will take a drink from our drink if we have
    /// enough liquid left in our drink.
    
    /// - parameter amount:  The amount to drink
    /// - throws: DrinkError.insufficentVolume if there is not
    /// enough volume left
    mutating func drinking(amount: Double) throws {
        guard amount < volume else {
            throw DrinkErrors.insufficentVolume
        }
        volume -= amount
    }
    
    
    /// This method will change the temperature of the drink.
    ///
    /// - parameter change:  The amount to change, can be negative
    ///    or positive
    ///
    /// - throws:
    ///    - DrinkError.tooHot if the drink is to hot
    ///    - DrinkError.tooCold if the drink is to cold
    ///
    
    mutating func temperatureChange(change: Double) throws {
        temperature += change
        guard temperature > 35 else {
            throw DrinkErrors.tooCold(temp: temperature)
        }
        guard temperature < 45 else {
            throw DrinkErrors.tooHot(temp: temperature)
        }
    }
}


var myDrink = Drink(volume: 23.5, caffeine: 280,
    temperature: 38.2, drinkSize: DrinkSize.Can24,
    description: "Drink Structure")

do {
    try myDrink.drinking(amount: 50.0)
    print("Took Drink")
} catch DrinkErrors.insufficentVolume{
    print("Error taking drink")
}

do {
    try myDrink.temperatureChange(change: 20.0)
} catch DrinkErrors.tooHot(let temp) {
    print("Drink too hot: \(temp) degrees ")
} catch DrinkErrors.tooCold(let temp) {
    print("Drink too cold: \(temp) degrees ")
}

try? myDrink.temperatureChange(change: 20.0)