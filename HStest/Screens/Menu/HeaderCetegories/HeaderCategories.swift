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

    init(categories: [Categories], delegate: MenuTableViewManagerInput?) {
        super.init(frame: .zero)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(releaseIndexPath),
                                               name: Notification.Name("getIndexPath"),
                                               object: nil)
        self.delegate = delegate
        self.items = categories
        Bundle.main.loadNibNamed("HeaderCategories", owner: self, options: nil)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: CategoryCell.identifier)
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
    
    
    
    @objc func releaseIndexPath(notification: NSNotification) {
    if let indexPath = notification.object as? NSDictionary {
        if let myIndex = indexPath["indexPath"] as? String{
            var number = 0

            items?.forEach({ item in
                item.isSelected = true
                if Int(myIndex) ?? 0 >= item.number {
                    number = item.id
                }
            })
            items?.indices.filter { Int(items?[$0].id ?? 0) == number }.forEach { items?[$0].isSelected = false }
            
            UIView.animate(withDuration: 0.1) {
                self.collectionView.scrollToItem(at: IndexPath(row: number, section: 0), at: .centeredHorizontally, animated: false)
            } completion: { _ in
                self.collectionView.reloadData()
            }
        }
    }
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
        cell.configure(item: item ?? Categories.init(id: 0, name: "", number: 0, isSelected: true), delegate: delegate)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items?.forEach({ item in
            item.isSelected = true
        })
        
        items?.indices.filter { Int(items?[$0].id ?? 0) == indexPath.row }.forEach {
            items?[$0].isSelected = false
        }
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell else { return }
        cell.configure(item: items?[indexPath.row] ?? Categories.init(id: 0, name: "", number: 0, isSelected: true), delegate: delegate)
        cell.selectedCell()
        collectionView.reloadData()

    }
}


