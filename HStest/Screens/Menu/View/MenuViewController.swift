//
//  MenuViewController.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation
import UIKit

protocol MenuVCInput: AnyObject {
    func success(viewModel: MenuViewModel, delegate: MenuTableViewManagerDelegate)
    func failure(error: Error)
}


class MenuViewController: UIViewController {

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var presenter: MenuVCOutput?
    var tableViewManager: MenuTableViewManagerInput?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Меню"

//        navigationItem.titleView = mainImageView
//        navigationController?.navigationBar.backgroundColor = .gray
        setViews()
        setConstraints()
        presenter?.viewIsReady()
        tableViewManager?.setup(tableView: tableView)

    }


    private func setViews() {
        view.backgroundColor = .white
        tableView.register(UINib(nibName: "FoodCell", bundle: nil), forCellReuseIdentifier: "FoodCell")

        view.addSubview(tableView)

    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension MenuViewController: MenuVCInput {
    func success(viewModel: MenuViewModel, delegate: MenuTableViewManagerDelegate) {
        tableViewManager?.update(with: viewModel)
    }
    
    func failure(error: Error) {
        
    }
    
    
}


