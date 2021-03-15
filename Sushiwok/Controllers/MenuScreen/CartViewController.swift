//
//  CartViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 02.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CartViewController: UIViewController{
    
    var addProductArray: [Product]?
    
    var price: CFloat = 0.00
    
    @IBOutlet weak var prizeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

extension CartViewController {
    private func setupTableView(){
        prizeTableView.delegate = self
        prizeTableView.dataSource = self
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
