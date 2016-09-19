//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol ExerciseType {
    var name: String {get}
    var caloriesBurned: Double {get}
    var minutes: Double {get}
}

struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let caloriesBurned: Double
    let minutes: Double
}
let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}
let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

/*func caloriesBurnedPerMinute<Exercise: ExerciseType>(exercise: Exercise) -> Double {
    return exercise.caloriesBurned / exercise.minutes
}

print(caloriesBurnedPerMinute(ellipticalWorkout))
print(caloriesBurnedPerMinute(runningWorkout))*/

extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}
print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

