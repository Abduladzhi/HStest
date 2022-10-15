//
//  Configurable.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation

protocol Configurable {
    associatedtype Model
    func configure(with model: Model)
}
