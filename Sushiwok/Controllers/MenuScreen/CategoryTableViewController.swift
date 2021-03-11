//
//  ContentMenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 20.02.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CategoryTableViewController: UIViewController{
    
    var tableViewPage:Int?
    
    private var products: [[Product]]{
        get{
            return ProductApi.createProductList()
        }
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTablePagingCell.self, forCellReuseIdentifier: CategoryTablePagingCell.cellIdentifier)
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

extension CategoryTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products[tableViewPage!].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTablePagingCell.cellIdentifier, for: indexPath) as! CategoryTablePagingCell
        cell.categoryItem = products[tableViewPage!][indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[tableViewPage!][indexPath.row]
        
        let storyboard = UIStoryboard(name: "Product", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ProductDetails") as? ProductViewController {
            vc.product = product
            self.navigationController?.pushViewController(vc, animated: true)
            self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1)
        }
    }
}
