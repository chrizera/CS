//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

typealias Velocity = Double

extension Velocity {
    var kph: Velocity { return self * 1.6 }
    var mph: Velocity {return self }
}

protocol VehicleType {
    var topSpeed: Velocity {get}
    var numberOfDoors: Int {get}
    var hasFlatBed: Bool {get}
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue >= 0 && newValue <= 1.0, "New value must be between 0 and 1.")
        }
    }
    let numberOfDoors: Int
}

extension Car: VehicleType {
    var topSpeed: Velocity {return 180}
    
    var hasFlatBed: Bool {return false}
}

extension Car {
    init(carMake: String, carModel: String, carYear: Int) {
        self.init(make: carMake, model: carModel, year: carYear, color: "Black", nickname: "N/A", gasLevel: 1.0, numberOfDoors: 4)
    }
}

var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)

extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        }
        else {
            return .Sedan
        }
    }
}
c.kind.description

extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount > 0 && amount <= 1, "Must be between 0 and 1")
        gasLevel -= amount
    }
    mutating func fillGas() {
        gasLevel = 1.0
    }
}
c.emptyGas(0.6)
c.gasLevel
c.fillGas()
c.gasLevel

extension Int {
    func timesFive() -> Int {
        return self*5
    }
}

5.timesFive()

