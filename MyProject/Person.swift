//
//  Person.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 27.03.2023.
//

import Foundation

struct Person {
    var name: String
    var surname: String
    var phone: String
    var email: String
    var heght: Double
    var weight: Double
}

extension Person {
    static func getPerson () -> Person {
        Person(name: "",
               surname: "",
               phone: "",
               email: "",
               heght: 0.0,
               weight: 0.0)
    }
}

