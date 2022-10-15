//
//  MenuModel.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation

struct MenuModel: Codable {
    let items: [Items]

}
struct Items: Codable {
    let nameCategory: String
    let products: [Products]
}

struct Products: Codable {
    let id: String
    let name: String
    let description: String
    let img: String
    let price: String
    let mass: String
}

struct Categories {
    var name: String
    var number: Int
    var isSelected: Bool
}
