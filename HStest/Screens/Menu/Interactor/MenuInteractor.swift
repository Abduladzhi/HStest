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
                
            case .failure(let error):
                print(error)
            }
         }
    }
}
