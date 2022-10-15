//
//  CollectionExt.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation

extension Collection {
    
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
