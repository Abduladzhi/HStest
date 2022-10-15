//
//  MenuModel.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation

class MenuModel: Codable {
    let items: [Items]

}
class Items: Codable {
    let nameCategory: String
    let products: [Products]
}

class Products: Codable {
    var nameCategory: String?
    let name: String
    let description: String
    let img: String
    init(nameCategory: String?, name: String, description: String, img: String) {
        self.nameCategory = nameCategory
        self.name = name
        self.description = description
        self.img = img
    }
}

class Categories: Codable {
    var id: Int
    var name: String
    var number: Int
    var isSelected: Bool?
    
    init(id: Int, name: String, number: Int, isSelected: Bool?) {
        self.id = id
        self.name = name
        self.number = number
        self.isSelected = isSelected
    }
}
