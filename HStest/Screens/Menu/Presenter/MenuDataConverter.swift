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
    private typealias BannerConfigurator = TableCellConfigurator<BannerCell, BannerCell.Model>
    
    func convert(items: MenuModel, delegate: AnyObject?) -> MenuViewModel {
        var section: [MenuViewModel.Section] = []
        let bannerSection = bannerSection()
        section.append(bannerSection)
        let foodsSection = newSection(menu: items.items, delegate: delegate as! MenuTableViewManagerDelegate)
        section.append(foodsSection)
        
        return MenuViewModel(sections: section)
    }
    
    private func bannerSection() -> Section {
        var rows: [Row] = []
        let arrayCategories: [Categories] = []
        
        let bannerModel = BannerCell.Model()
        let bannerConfigurator = BannerConfigurator(item: bannerModel)
        rows.append(Row(configurator: bannerConfigurator))
        
        return Section(headerCategories: arrayCategories, rows: rows)
    }

    private func newSection(menu: [Items], delegate: MenuTableViewManagerDelegate) -> Section {
        var countCategories = 0
        var id = -1
        var rows: [Row] = []
        var arrayCategories: [Categories] = []
        menu.forEach { item in
            item.products.forEach { product in
                let foodModel = FoodCell.Model(menu: Products.init(nameCategory: item.nameCategory, name: product.name, description: product.description, img: product.img), delegate: delegate)
                let foodConfigurator = FoodConfigurator(item: foodModel)
                rows.append(Row(configurator: foodConfigurator))
            }
            id += 1
            arrayCategories.append(Categories.init(id: id, name: item.nameCategory, number: countCategories, isSelected: nil))
            countCategories += item.products.count
        }
        
        return Section(headerCategories: arrayCategories, rows: rows)
    }

}


