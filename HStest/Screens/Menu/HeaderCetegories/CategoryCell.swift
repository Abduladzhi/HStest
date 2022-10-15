//
//  CategoryCell.swift
//  HStest
//
//  Created by Abduladzhi on 15.10.2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(item: Categories, delegate: MenuTableViewManagerInput) {
        myLabel.text = item.name
    }
}
