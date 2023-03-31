//
//  Service.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 30.03.2023.
//

import Foundation

class DataStore {
    static let shared = DataStore()
    var titles = [ "Имя", "Фамилия", "Номер телефона", "Почта", "Рост", "Вес"]

    private init() {} // тоже не совсем понял зачем это прописывать
}

enum RecomendedType {
    case deficit
    case normal
    case overweight
    case obesity
    
    var definition: String {
        switch self {
        case .deficit:
           return "Необходима консультация специалиста. Изпользовать в пищу каллорийные продукты."
        case .normal:
            return "У вас нормальный вес! Так держать!"
        case .overweight:
            return "У вас избытачный вес, необходимо сократить каллории. Изпользуйте в пишу продукты с низкой каллорийностью. Сократите прием сахара."
        case .obesity:
            return "Необходима срочная консультация специалиста. У вас ожирение. Изпользуйте в пишу продукты с низкой каллорийностью."
        }
    }
}
