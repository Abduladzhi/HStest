//
//  MenuScreenAssembly.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation
import UIKit

final class MenuSceenAssembly {
    
    static func assembleMenuScreen() -> UIViewController {
        let view = MenuViewController()

        let dataConverter = MenuDataConverter()
        let tableViewManager = MenuTableViewManager()
        let networkManager = NetworkManager()
        let presenter = MenuPresenter(dataConverter: dataConverter)
        let interactor = MenuInteractor()
        
        interactor.networkManager = networkManager
        interactor.presenter = presenter
        view.presenter = presenter
        view.tableViewManager = tableViewManager
        presenter.view = view
        presenter.interactor = interactor
        tableViewManager.delegate = presenter
        
        return view
    }
}
