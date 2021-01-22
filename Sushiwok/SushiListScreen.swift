//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class SushiListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sushi = [Sushi]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sushi = createSushiArray()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func createSushiArray() -> [Sushi]{
        var tempArray = [Sushi]()
        
        let sushi1 = Sushi(image: #imageLiteral(resourceName: "sushi1"), title: "Фила Бум")
        let sushi2 = Sushi(image: #imageLiteral(resourceName: "sushi2"), title: "Умка")
        let sushi3 = Sushi(image: #imageLiteral(resourceName: "sushi1"), title: "Филомания")
        let sushi4 = Sushi(image: #imageLiteral(resourceName: "sushi4"), title: "Уикенд")
        let sushi5 = Sushi(image: #imageLiteral(resourceName: "sushi3"), title: "Набор Искушение")
        
        tempArray.append(sushi1)
        tempArray.append(sushi2)
        tempArray.append(sushi3)
        tempArray.append(sushi4)
        tempArray.append(sushi5)
        
        return tempArray
    }
}

extension SushiListScreen:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sushi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sushiItem = sushi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SushiCell") as! SushiCell
        
        cell.setSushi(sushi: sushiItem)
        
        return cell
    }
}
