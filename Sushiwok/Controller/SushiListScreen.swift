//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

protocol SushiListScreenDelegate {
    func toggleMenu()
}

class SushiListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sushi = [Sushi]()
    var delegate: SushiListScreenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sushi = createSushiArray()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func createSushiArray() -> [Sushi]{
        var tempArray = [Sushi]()
        
        let sushi1 = Sushi(image: #imageLiteral(resourceName: "sushi1"), title: "Фила Бум", description: "ролл Филадельфия 2 шт., ролл Филадельфия в угре, ролл Филадельфия в масаго, ролл Фудживара 1031 г")
        let sushi2 = Sushi(image: #imageLiteral(resourceName: "sushi2"), title: "Умка", description: "ролл Фиеста, ролл Сэнсей, ролл Калифорния в кунжуте 653 г")
        let sushi3 = Sushi(image: #imageLiteral(resourceName: "sushi1"), title: "Филомания", description: "ролл Филадельфия в масаго, ролл Филадельфия, ролл Калифорния в кунжуте, ролл с огурцом 707 г")
        let sushi4 = Sushi(image: #imageLiteral(resourceName: "sushi4"), title: "Уикенд", description: "ролл Сочная креветка, ролл Хатамото, запеч. ролл Окунь-гриль, запеч. ролл Крабик Хот, ролл Калифорния с креветкой, ролл Марокко, запеч. ролл Румяный, запеч. ролл Сырный, ролл Фудживара 1707 г")
        let sushi5 = Sushi(image: #imageLiteral(resourceName: "sushi3"), title: "Набор Искушение", description: "ролл Ореховый рай, ролл Берри, ролл Сочный фрукт 438 г")
        
        tempArray.append(sushi1)
        tempArray.append(sushi2)
        tempArray.append(sushi3)
        tempArray.append(sushi4)
        tempArray.append(sushi5)
        
        return tempArray
    }
    
    @IBAction func tappedMenu(_ sender: UIBarButtonItem) {
        if let delegateVC = delegate{
             delegateVC.toggleMenu()
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sushiItem = sushi[indexPath.row]

        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailSushi") as? DetailSushi {
            vc.setDetailSushi(sushi: sushiItem)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
