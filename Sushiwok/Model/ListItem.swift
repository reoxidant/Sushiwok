//
//  Sushi.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation
import UIKit

struct ListItem {
    var image:UIImage
    var title:String
    var description:String
    
    static func createSushiArray() -> [ListItem]{
        var tempArray = [ListItem]()
        
        let sushi1 = ListItem(image: #imageLiteral(resourceName: "sushi1"), title: "Фила Бум", description: "ролл Филадельфия 2 шт., ролл Филадельфия в угре, ролл Филадельфия в масаго, ролл Фудживара 1031 г")
        let sushi2 = ListItem(image: #imageLiteral(resourceName: "sushi2"), title: "Умка", description: "ролл Фиеста, ролл Сэнсей, ролл Калифорния в кунжуте 653 г")
        let sushi3 = ListItem(image: #imageLiteral(resourceName: "sushi1"), title: "Филомания", description: "ролл Филадельфия в масаго, ролл Филадельфия, ролл Калифорния в кунжуте, ролл с огурцом 707 г")
        let sushi4 = ListItem(image: #imageLiteral(resourceName: "sushi4"), title: "Уикенд", description: "ролл Сочная креветка, ролл Хатамото, запеч. ролл Окунь-гриль, запеч. ролл Крабик Хот, ролл Калифорния с креветкой, ролл Марокко, запеч. ролл Румяный, запеч. ролл Сырный, ролл Фудживара 1707 г")
        let sushi5 = ListItem(image: #imageLiteral(resourceName: "sushi3"), title: "Набор Искушение", description: "ролл Ореховый рай, ролл Берри, ролл Сочный фрукт 438 г")
        
        tempArray.append(sushi1)
        tempArray.append(sushi2)
        tempArray.append(sushi3)
        tempArray.append(sushi4)
        tempArray.append(sushi5)
        
        return tempArray
    }
}
