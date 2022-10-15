//
//  MenuTableViewManager.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import Foundation
import UIKit

protocol MenuTableViewManagerInput {
    func setup(tableView: UITableView)
    func update(with viewModel: MenuViewModel)
    func getIndex(index: Int)
}

protocol MenuTableViewManagerDelegate: AnyObject {

}


final class MenuTableViewManager: NSObject{
    
    weak var delegate: MenuTableViewManagerDelegate?
    private weak var tableView: UITableView?
    private var viewModel: MenuViewModel?
}

extension MenuTableViewManager: MenuTableViewManagerInput {
    func getIndex(index: Int) {

        guard index == 0 else {
            tableView?.scrollToRow(at: IndexPath(row: index, section: 1), at: .top, animated: true)
            return
        }
        tableView?.scrollToRow(at: IndexPath(row: index, section: 1), at: .top, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let indexPath = ["indexPath": "\(tableView?.indexPathsForVisibleRows?.first?.row ?? 0)"]
        
        NotificationCenter.default.post(name: Notification.Name("getIndexPath"), object: indexPath)
    }
    
    func setup(tableView: UITableView) {
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    func update(with viewModel: MenuViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
}

extension MenuTableViewManager: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? 0
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[safe: section]?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.sections[safe: indexPath.section]?.rows[safe: indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        row.configurator.configure(cell: cell)
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MenuTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let categories = viewModel?.sections[section].headerCategories
        
        let header = HeaderCategories(categories: categories ?? [Categories.init(id: 0, name: "", number: 0, isSelected: true)], delegate: self)
        if section == 1 {
            return header
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        if section == 1 {
            return 64
        } else {
            return 0
        }
    }
}
