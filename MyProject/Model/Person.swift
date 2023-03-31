//
//  Person.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 27.03.2023.
//

import Foundation

struct Person {
    var name = ""
    var surname = ""
    var phone = ""
    var email = ""
    var height = ""
    var weight = ""
    
    var fullForm: [String] {
        ["\(name)", "\(surname)","\(phone)","\(email)","\(height)","\(weight)"]
    }
    
    var indexMass: Double {
        let resultIndex =  Double(height) ?? 0.0 / (Double(height) ?? 0.0 * 2.0 / 100.0)
        return resultIndex // не работает вычисление у меня
    }
    
    static let initial = Person() // загуглил, но сам так и не понял почему именно так надо было прописать
}

extension Person {
    static func getTitles() -> [String] {
        let dataStore = DataStore.shared
        let titles = dataStore.titles
        
        return titles
    }
}

extension Person {
    static func getRecoment() -> String {
        var recomendText = String()
        
        switch initial.indexMass {
        case 0 ... 18.50:
            recomendText = RecomendedType.deficit.definition
        case 18.51 ... 24.99:
           recomendText = RecomendedType.normal.definition
        case 25.0 ... 29.99:
           recomendText = RecomendedType.overweight.definition
        default:
            recomendText = RecomendedType.obesity.definition
        }
        return recomendText
    }
    // только default срабатывает
}

