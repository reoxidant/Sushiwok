//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class MenuListScreen: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    var tableViewPage:Int?
    var itemCategories = [[ListItem]]()
    var names = ["Попробуй!", "Наборы и комбо", "Роллы", "Запеченные роллы", "Wok", "Вегетаринские блюда", "Суши", "Пицца", "Салаты и закуски", "Супы", "Горячее", "Десерты и напитки", "Дополнительно"]
    
    var reuseIdentifier:String = "CategoryViewCellReuseIdentifier"
    
    var nameForNib: String = "CategoryViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPage = 0
        
        itemCategories = ListItem.createSushiArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        registerNib()
        categoryCollectionView.allowsMultipleSelection = false
        categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
        
        // Do any additional setup after loading the view.
        
        setMenuBtn(menuBtn)
    }
    
    func registerNib(){
        let nib = UINib(nibName: nameForNib, bundle: nil)
        categoryCollectionView?.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        if let flowLayout = self.categoryCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
        categoryCollectionView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: Create function for menu Action
    
    func setMenuBtn(_ menuBar: UIBarButtonItem){
        menuBar.target = revealViewController()
        menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}

extension MenuListScreen:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCategories[tableViewPage!].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sushiItem = itemCategories[tableViewPage!][indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell") as! ListItemCell
        
        cell.setListItem(item: sushiItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sushiItem = itemCategories[tableViewPage!][indexPath.row]
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailSushi") as? DetailListItem {
            vc.setDetailListItem(item: sushiItem)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension MenuListScreen: UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let cell: CategoryViewCell =
            Bundle.main.loadNibNamed(nameForNib, owner: self, options: nil)?.first as? CategoryViewCell else {
                return .zero
        }
        
        cell.configureCell(name: names[indexPath.row])
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryViewCell{
            cell.isSelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryViewCell{
            cell.isSelected = false
        }
    }
}

extension MenuListScreen: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CategoryViewCell{
            let name = names[indexPath.row]
            cell.configureCell(name: name)
            cell.layer.cornerRadius = 10
            cell.layer.borderColor = UIColor.black.withAlphaComponent(0.3).cgColor
            cell.layer.borderWidth = 1
            if cell.isSelected{
                cell.layer.borderColor = UIColor.clear.cgColor
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
