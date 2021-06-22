//
//  SessionModel.swift
//  FretelloApp
//
//  Created by Decagon on 11/06/2021.
//

import Foundation

struct ExerciseSessionElement: Codable {
    let name, practicedOnDate: String
    let exercises: [Exercise]
}

// MARK: - Exercise
struct Exercise: Codable {
    let exerciseID, name: String
    let practicedAtBPM: Int

    enum CodingKeys: String, CodingKey {
        case exerciseID = "exerciseId"
        case name
        case practicedAtBPM = "practicedAtBpm"
    }
}

typealias ExerciseSession = [ExerciseSessionElement]
