//
//  MenuViewModel.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation

struct MenuViewModel {
    
    let sections: [Section]
    
    struct Section {
        
        let headerCategories: [Categories]?
        let rows: [Row]
        
        struct Row {
            
            let configurator: TableCellConfiguratorProtocol
           
            var reuseId: String {
                return type(of: configurator).reuseId
            }
        }
    }
}
