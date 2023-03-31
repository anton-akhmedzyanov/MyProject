//
//  Services.swift
//  MyProject
//
//  Created by Anton Akhmedzyanov on 30.03.2023.
//

import Foundation

class DataStore {
    static let shared = DataStore()
    var titles = [ "Имя", "Фамилия", "Номер телефона", "Почта", "Рост", "Вес"]
    private init() {}
}
