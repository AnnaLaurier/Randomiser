//
//  RandomNumber.swift
//  Randomiser
//
//  Created by Anna Lavrova on 27.02.2024.
//

import Foundation

struct RandomNumber {
    var minimumValue: Int
    var maximumValue: Int

    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }
}
