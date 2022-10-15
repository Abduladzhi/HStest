//
//  MenuInteractor.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation


protocol MenuInteractorInput {
    func getMenuData()
}

final class MenuInteractor {
    private let productsKey = "ProductsKey"
    var presenter: MenuInteractorOutput?
    var networkManager: NetworkManager?
}

extension MenuInteractor: MenuInteractorInput {

    func getMenuData() {
        guard let url = URL(string: "https://abduladzhi.ru/api-tri-choco/home.php") else { fatalError("Invalid URL")
        }

        networkManager?.request(fromURL: url) { (result: Result<MenuModel, Error>) in
            switch result {
            case .success(let items):
                self.presenter?.didSuccessGetMenu(items: items)
                self.saveProduct(product: items)
            case .failure(let error):
                let arr = self.getProduct(product: MenuModel.self)
                if arr != nil {
                    self.presenter?.didSuccessGetMenu(items: arr as! MenuModel)
                } else {
                    print(error)
                }
            }
         }
    }
    
    func saveProduct<T>(product: T) where T : Decodable, T : Encodable {
        let defaults = UserDefaults.standard
        defaults.setCodableObject(product, forKey: productsKey)
    }
    
    func getProduct<T>(product: T.Type) -> Any? where T : Decodable, T : Encodable {
        let defaults = UserDefaults.standard
        let myarray = defaults.codableObject(dataType: product, key: productsKey)
        return myarray
    }
    
}

