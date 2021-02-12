//
//  CategoryMenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 30.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CategoryMenuCollectionView: UICollectionView {
    
//    weak var categoryMenuCollectionView: UICollectionView!
//
//    private let nameForNib = "CategoryMenuViewCell"
//
//    var labelView = UILabel()
//
//    private let cellReuseIdentifier = "categoryMenuCell"
//
//    var names = ["Попробуй!", "Наборы и комбо", "Роллы", "Запеченные роллы", "Wok", "Вегетаринские блюда", "Суши", "Пицца", "Салаты и закуски", "Супы", "Горячее", "Десерты и напитки", "Дополнительно"]
//
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout:layout)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//extension CategoryMenuCollectionView: UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? CategoryMenuViewCell{
//           let name = names[indexPath.row]
//           cell.configureCell(name:name)
//           cell.layer.cornerRadius = 10
//           cell.layer.borderColor = UIColor.black.cgColor
//           cell.layer.borderWidth = 1
//           if cell.isSelected {
//               cell.layer.borderColor = UIColor.clear.cgColor
//               labelView.text = name
//           }
//
//           return cell
//        }
//
//        return UICollectionViewCell()
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        names.count
//    }
//}
//
//extension CategoryMenuCollectionView:UICollectionViewDelegateFlowLayout{
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        guard names.count != 0 else {
//            return CGSize.zero
//        }
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoryMenuViewCell
//        cell.configureCell(name: names[indexPath.row])
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
//
//        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//        return CGSize(width: size.width, height: 30)
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryMenuViewCell{
//            cell.isSelected = true
//            self.labelView.text = cell.nameLabel.text
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryMenuViewCell {
//             cell.isSelected = false
//        }
//    }
//}
