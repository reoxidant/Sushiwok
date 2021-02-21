//
//  ContentMenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 20.02.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ContentMenuViewController: UIViewController{

    var tableViewPage:Int?
    var categoryMenuList = ["Наборы и комбо", "Роллы", "Wok", "Суши", "Pizza"]

    var itemCategories: [[ListItem]]{
        get{
            return CategoryItemApi.createListItems()
        }
    }

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListItemCell.self, forCellReuseIdentifier: ListItemCell.cellIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let displayWidht: CGFloat = self.view.frame.width
//        let displayHeight: CGFloat = self.view.frame.height
//
//        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidht, height: displayHeight))
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ContentMenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCategories[tableViewPage!].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListItemCell.cellIdentifier, for: indexPath) as! ListItemCell
        cell.categoryItem = itemCategories[tableViewPage!][indexPath.row]
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sushiItem = itemCategories[tableViewPage!][indexPath.row]
//
//        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailSushi") as? DetailListItem {
//            vc.setDetailListItem(item: sushiItem)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}

//extension ContentMenuViewController: UITableViewDelegate{}
