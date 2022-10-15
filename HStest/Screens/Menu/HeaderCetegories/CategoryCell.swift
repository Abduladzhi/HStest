//
//  CategoryCell.swift
//  HStest
//
//  Created by Abduladzhi on 15.10.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCell.self)
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myLabel: UILabel!
    
    var delegate: MenuTableViewManagerInput!
    var index: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func selectedCell() {
        delegate?.getIndex(index: index ?? 0)
    }
    
    func configure(item: Categories, delegate: MenuTableViewManagerInput) {
        self.index =  item.number
        self.delegate = delegate
        myLabel.text = item.name
        myView.layer.cornerRadius = 16
        myView.layer.masksToBounds = true
        if item.isSelected == false  {
            myView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.2)
            myView.layer.borderWidth = 0
            myLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
            myLabel.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        } else {
            myView.layer.borderWidth = 1
            myView.layer.borderColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.4)
            myView.backgroundColor = .clear
            myLabel.font = UIFont.systemFont(ofSize: 13)
            myLabel.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        }
        if item.isSelected == nil && self.index == 0 {
            myView.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.2274509804, blue: 0.4117647059, alpha: 0.2)
            myView.layer.borderWidth = 0
            myLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
            myLabel.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        }
    }
}
