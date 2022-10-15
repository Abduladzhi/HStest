//
//  ImageCell.swift
//  HStest
//
//  Created by Abduladzhi on 15.10.2022.
//

import UIKit

class ImageCell: UICollectionViewCell {
    static let identifier = String(describing: ImageCell.self)

    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
        img.layer.cornerRadius = 6
        img.layer.masksToBounds = true
    }
}
