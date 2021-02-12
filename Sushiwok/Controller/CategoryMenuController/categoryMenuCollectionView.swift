//
//  CategoryMenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 30.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CategoryMenuCollectionView: UICollectionView {
    
    private let cellReuseIdentifier = "categoryMenuCell"
    var names = ["Попробуй!", "Наборы и комбо", "Роллы", "Запеченные роллы", "Wok", "Вегетаринские блюда", "Суши", "Пицца", "Салаты и закуски", "Супы", "Горячее", "Десерты и напитки", "Дополнительно"]

    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .red
        
        delegate = self
        dataSource = self
        
        register(CategoryMenuCollectionView.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        
        layout.minimumLineSpacing = 30
        contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryMenuCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CategoryMenuViewCell
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        names.count
    }
}

extension CategoryMenuCollectionView:UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
}
