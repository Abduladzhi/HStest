//
//  FoodCell.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import UIKit

class FoodCell: UITableViewCell {
    static let identifier = String(describing: FoodCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var categoryName: UILabel!
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
        priceView.layer.cornerRadius = 6
        priceView.layer.masksToBounds = true
        priceView.layer.borderWidth = 1
        priceView.layer.borderColor = #colorLiteral(red: 1, green: 0.3348149955, blue: 0.4859694839, alpha: 1)
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 66
        categoryName.text = "Категория: \(model.menu.nameCategory ?? "")"
        nameLabel.text = model.menu.name
        img.loadImageAsync(with: model.menu.img)
        
        descriptionLabel.text = model.menu.description
    }
    
    
}
