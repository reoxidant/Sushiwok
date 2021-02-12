//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class MenuListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    var tableViewPage:Int?
    
    private var categoryManuViewCollection = CategoryMenuCollectionView()

    var itemCategories = [[ListItem]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewPage = 0
        
        itemCategories = ListItem.createSushiArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        setMenuBtn(menuBtn)
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
