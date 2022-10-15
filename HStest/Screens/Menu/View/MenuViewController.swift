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
        setViews()
        setShadowTabBar()
        setConstraints()
        presenter?.viewIsReady()
        tableViewManager?.setup(tableView: tableView)
    }
    
    private func setShadowTabBar() {
        let bannerWidth = navigationController!.navigationBar.frame.size.width / 3
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 83, height: 20))
        let imageView = UIImageView(frame: CGRect(x: -bannerWidth , y: 0, width: 83, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "moscow")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
        tabBarController?.tabBar.shadowImage = UIImage()
        tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0, height: 6)
        tabBarController?.tabBar.layer.shadowRadius = 40
        tabBarController?.tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBarController?.tabBar.layer.shadowOpacity = 2
        tabBarController?.tabBar.layer.shadowPath = UIBezierPath(rect: CGRect(
                                                     x: 0,
                                                     y: 0,
                                                     width: tabBarController?.tabBar.bounds.width ?? 10,
                                                     height: tabBarController?.tabBar.layer.shadowRadius ?? 10)).cgPath
    }

    private func setViews() {
        title = "Меню"
        view.backgroundColor = .white
        tableView.register(UINib(nibName: "FoodCell", bundle: nil), forCellReuseIdentifier: FoodCell.identifier)
        tableView.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: BannerCell.identifier)
        tableView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 0.9764705882, alpha: 1)
        tableView.separatorColor = .clear
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
