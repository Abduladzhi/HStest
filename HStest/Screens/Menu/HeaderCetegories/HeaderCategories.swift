//
//  HeaderCategories.swift
//  HStest
//
//  Created by Abduladzhi on 14.10.2022.
//

import UIKit


final class HeaderCategories: UIView {
    
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: MenuTableViewManagerInput!
    var items: [Categories]?
    var previousSelectedRate = IndexPath(row: 0, section: 0)

    
    init(categories: [Categories], delegate: MenuTableViewManagerInput?) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.items = categories
        Bundle.main.loadNibNamed("HeaderCategories", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        let layout = UICollectionViewFlowLayout()
                layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderCategories: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let item = items?[indexPath.row]
        cell.configure(item: item ?? Categories.init(name: "", number: 0, isSelected: true), delegate: delegate)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}


