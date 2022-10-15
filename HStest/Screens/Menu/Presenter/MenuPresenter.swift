//
//  MenuPresenter.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation

protocol MenuVCOutput {
    func viewIsReady()
}

protocol MenuInteractorOutput: AnyObject {
    func didSuccessGetMenu(items: MenuModel)
}

final class MenuPresenter {
    
    weak var view: MenuVCInput!
    var interactor: MenuInteractorInput!
    private let dataConverter: MenuDataConverterInput!

    init(dataConverter: MenuDataConverterInput) {
        self.dataConverter = dataConverter
    }

}


extension MenuPresenter: MenuVCOutput {
    func viewIsReady() {
        interactor?.getMenuData()
    }
}

extension MenuPresenter: MenuInteractorOutput {

    func didSuccessGetMenu(items: MenuModel) {
        let viewModel = self.dataConverter.convert(items: items, delegate: self)
        self.view?.success(viewModel: viewModel, delegate: self)
    }
}


extension MenuPresenter: MenuTableViewManagerDelegate {
    
}
