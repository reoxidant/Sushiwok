//
//  CartViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 02.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CartViewController: UIViewController{
    
    var cartProducts = [Product]()
        
    @IBOutlet weak var productTableView: UITableView!
    
    @IBOutlet weak var prizeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        cartProducts = CartProduct.shared.getAllProducts()
        
        setupTableView()
    }
}

extension CartViewController {
    private func setupTableView(){
        productTableView.delegate = self
        productTableView.dataSource = self
    
        productTableView.register(CategoryTablePagingCell.self, forCellReuseIdentifier: CategoryTablePagingCell.cellIdentifier)
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTablePagingCell.cellIdentifier, for: indexPath) as!
        CategoryTablePagingCell
        cell.categoryItem = cartProducts[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
