import UIKit

protocol Vehicle {
    var hitPoints: Int {get set}
}


extension Vehicle {
    mutating func takeHit(amount: Int) { hitPoints -= amount }
    func hitPointsRemaining() -> Int { return hitPoints }
    func isAlive() -> Bool { return hitPoints > 0 ? true : false }
}

protocol LandVehicle: Vehicle {
    var landAttack: Bool {get}
    var landMovement: Bool {get}
    var landAttackRange: Int {get}
    
    func doLandAttack()
    func doLandMovement()
}

protocol SeaVehicle: Vehicle {
    var seaAttack: Bool {get}
    var seaMovement: Bool {get}
    var seaAttackRange: Int {get}
    
    func doSeaAttack()
    func doSeaMovement()
}

protocol AirVehicle: Vehicle {
    var airAttack: Bool {get}
    var airMovement: Bool {get}
    var airAttackRange: Int {get}
    
    func doAirAttack()
    func doAirMovement()
}

struct Tank: LandVehicle {
    var hitPoints = 68
    let landAttackRange = 5
    let landAttack = true
    let landMovement = true
    
    func doLandAttack() { print("Tank Attack") }
    func doLandMovement() { print("Tank Move") }
}

struct Amphibious: LandVehicle, SeaVehicle {
    var hitPoints = 25
    let landAttackRange = 1
    let seaAttackRange = 1
    let landAttack = true
    let landMovement = true
    let seaAttack = true
    let seaMovement = true
    
    func doLandAttack() { print("Amphibious Land Attack") }
    func doLandMovement() { print("Amphibious Land Move") }
    func doSeaAttack() { print("Amphibious Sea Attack") }
    func doSeaMovement() { print("Amphibious Sea Move") }
}

struct Submarine: SeaVehicle {
    var hitPoints = 35
    let seaAttackRange = 2
    let seaAttack = true
    let seaMovement = true
    
    func doSeaAttack() { print("Submarine Attack") }
    func doSeaMovement() { print("Submarine Move") }
}

struct Jet: AirVehicle {
    var hitPoints = 20
    let airAttackRange = 10
    let airAttack = true
    let airMovement = true
    
    func doAirAttack() { print("Jet Attack") }
    func doAirMovement() { print("Jet Move") }
}

struct Transformer: LandVehicle, SeaVehicle, AirVehicle {
    var hitPoints = 75
    let landAttackRange = 7
    let seaAttackRange = 10
    let airAttackRange = 12
    let landAttack = true
    let landMovement = true
    let seaAttack = true
    let seaMovement = true
    let airAttack = true
    let airMovement = true
    
    func doLandAttack() { print("Transformer Land Attack") }
    func doLandMovement() { print("Transformer Land Move") }
    func doSeaAttack() { print("Transformer Sea Attack") }
    func doSeaMovement() { print("Transformer Sea Move") }
    func doAirAttack() { print("Transformer Sea Attack") }
    func doAirMovement() { print("Transformer Sea Move") }
}


var vehicles = [Vehicle]()

var vh1 = Amphibious()
var vh2 = Amphibious()
var vh3 = Tank()
var vh4 = Transformer()

vehicles.append(vh1)
vehicles.append(vh2)
vehicles.append(vh3)
vehicles.append(vh4)


for (index, vehicle) in vehicles.enumerated() {
    if let Vehicle = vehicle as? AirVehicle {
        print("Vehicle at \(index) is Air")
    }
    if let Vehicle = vehicle as? LandVehicle {
        print("Vehicle at \(index) is Land")
    }
    if let Vehicle = vehicle as? SeaVehicle {
        print("Vehicle at \(index) is Sea")
    }
}


for (index, vehicle) in vehicles.enumerated() where vehicle is SeaVehicle {
    var vh = vehicle as! SeaVehicle
    if vh.seaAttack {
        print("---Can do Sea attack")
    }
    if vh.seaMovement {
        print("---Can do Sea movement")
    }
}

for (index, vehicle) in vehicles.enumerated() where vehicle is AirVehicle {
    var vh = vehicle as! AirVehicle
    if vh.airAttack {
        print("---Can do Air attack")
    }
    if vh.airMovement {
        print("---Can do Air movement")
    }
}

for (index, vehicle) in vehicles.enumerated() where vehicle is LandVehicle {
    var vh = vehicle as! LandVehicle
    if vh.landAttack {
        print("---Can do Land attack")
    }
    if vh.landMovement {
        print("---Can do Land movement")
    }
}


protocol VehicleList {
    associatedtype T: Vehicle
}
