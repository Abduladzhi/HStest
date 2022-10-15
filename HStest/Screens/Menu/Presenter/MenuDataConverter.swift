//
//  MenuDataConverter.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation

protocol MenuDataConverterInput {

    func convert(items: MenuModel, delegate: AnyObject?) -> MenuViewModel
}

final class MenuDataConverter { }

extension MenuDataConverter: MenuDataConverterInput {


    private typealias Row = MenuViewModel.Section.Row
    private typealias Section = MenuViewModel.Section
    private typealias FoodConfigurator = TableCellConfigurator<FoodCell, FoodCell.Model>

    func convert(items: MenuModel, delegate: AnyObject?) -> MenuViewModel {
        var section: [MenuViewModel.Section] = []
        let godmfd = newSection(menu: items.items, delegate: delegate as! MenuTableViewManagerDelegate)
        section.append(godmfd)
        let nnweofe = newSection(menu: items.items, delegate: delegate as! MenuTableViewManagerDelegate)
        section.append(nnweofe)
        
        return MenuViewModel(sections: section)
    }

    private func newSection(menu: [Items], delegate: MenuTableViewManagerDelegate) -> Section {
        
        var rows: [Row] = []
        var arrayCategories: [Categories] = []
        menu.forEach { task in
            task.products.forEach { item in
                let taskModel = FoodCell.Model(menu: item, delegate: delegate)
                let taskConfigurator = FoodConfigurator(item: taskModel)
                rows.append(Row(configurator: taskConfigurator))
            }
            arrayCategories.append(Categories.init(name: task.nameCategory, number: task.products.count, isSelected: true))
        }
        
        return Section(headerCategories: arrayCategories, rows: rows)
    }

}


