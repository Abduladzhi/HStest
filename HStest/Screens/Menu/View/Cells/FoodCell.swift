//
//  FoodCell.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import UIKit

class FoodCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var label: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension FoodCell: Configurable {
    
    struct Model {
        var menu: Products
        var delegate: MenuTableViewManagerDelegate
    }
    
    func configure(with model: Model) {
        label.text = model.menu.name
    }
    
    
}
