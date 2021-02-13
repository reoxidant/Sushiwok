//
//  CategoryMenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 30.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class categoryMenuCollectionView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 30, height: 30)
        
        categoryMenuCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        categoryMenuCollectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "categoryMenuCell")
        categoryMenuCollectionView?.backgroundColor = UIColor.blue
        categoryMenuCollectionView?.showsHorizontalScrollIndicator = false
        
        view.addSubview(categoryMenuCollectionView ?? UICollectionView())
        
        self.view = view
    }

    
    var names = ["Попробуй!", "Наборы и комбо", "Роллы", "Запеченные роллы", "Wok", "Вегетаринские блюда", "Суши", "Пицца", "Салаты и закуски", "Супы", "Горячее", "Десерты и напитки", "Дополнительно"]
    

//    func registerNib(){
//        if let flowLayout = self.categoryMenuCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout
//        {
//            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
//        }
//        categoryMenuCollectionView.showsHorizontalScrollIndicator = false
//    }
}

extension categoryMenuCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryMenuCell", for: indexPath)
        myCell.backgroundColor = UIColor.white
        return myCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        names.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CategoryMenuViewCell{
//            let name = names[indexPath.row]
//            cell.configureCell(name:name)
//            cell.layer.cornerRadius = 10
//            cell.layer.borderColor = UIColor.black.cgColor
//            cell.layer.borderWidth = 1
//            if cell.isSelected {
//                cell.layer.borderColor = UIColor.clear.cgColor
//                labelView.text = name
//            }
//
//            return cell
//        }
//
//        return UICollectionViewCell()
//    }
}

extension categoryMenuCollectionView:UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//
//        guard let cell: CategoryMenuViewCell =
//            Bundle.main.loadNibNamed(nameForNib, owner: self, options: nil)?.first as? CategoryMenuViewCell else {
//                return CGSize.zero
//        }
//
//        cell.configureCell(name: names[indexPath.row])
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
       
//        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: 100, height: 30)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryMenuViewCell{
//            cell.isSelected = true
//            self.labelView.text = cell.nameLabel.text
//        }
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryMenuViewCell {
//             cell.isSelected = false
//        }
//    }
}
