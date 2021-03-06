//
//  ContentMenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 20.02.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CategoryItems: UIViewController{
    
    var tableViewPage:Int?
    var categoryMenuList = ["Наборы и комбо", "Роллы", "Wok", "Суши", "Pizza"]
    
    var itemCategories: [[CategoryItem]]{
        get{
            return CategoryItemApi.createListItems()
        }
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryItemsCell.self, forCellReuseIdentifier: CategoryItemsCell.cellIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension CategoryItems: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCategories[tableViewPage!].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryItemsCell.cellIdentifier, for: indexPath) as! CategoryItemsCell
        cell.categoryItem = itemCategories[tableViewPage!][indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sushiItem = itemCategories[tableViewPage!][indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailSushi") as? DetailCategoryItem {
            vc.setDetailListItem(item: sushiItem)
            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1)
            self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
        }
    }
}
