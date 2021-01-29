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
    
    static func createSushiArray() -> [[ListItem]]{
        let categories =
            [
                [
                    ListItem(image: #imageLiteral(resourceName: "fila-bum"), title: "Фила Бум", description: "ролл Филадельфия 2 шт., ролл Филадельфия в угре, ролл Филадельфия в масаго, ролл Фудживара 1031 г"),
                    ListItem(image: #imageLiteral(resourceName: "umka"), title: "Умка", description: "ролл Фиеста, ролл Сэнсей, ролл Калифорния в кунжуте 653 г"),
                    ListItem(image: #imageLiteral(resourceName: "filomaniya"), title: "Филомания", description: "ролл Филадельфия в масаго, ролл Филадельфия, ролл Калифорния в кунжуте, ролл с огурцом 707 г"),
                    ListItem(image: #imageLiteral(resourceName: "uikend"), title: "Уикенд", description: "ролл Сочная креветка, ролл Хатамото, запеч. ролл Окунь-гриль, запеч. ролл Крабик Хот, ролл Калифорния с креветкой, ролл Марокко, запеч. ролл Румяный, запеч. ролл Сырный, ролл Фудживара 1707 г"),
                    ListItem(image: #imageLiteral(resourceName: "iskushenie"), title: "Набор Искушение", description: "ролл Ореховый рай, ролл Берри, ролл Сочный фрукт 438 г")
                ],
                [
                    ListItem(image: #imageLiteral(resourceName: "midori"), title: "Ролл Окитори", description: "лосось, цыпленок, омлет тамаго, масаго, шеф-соус, спайси соус, кунжут 234 г"),
                    ListItem(image: #imageLiteral(resourceName: "ebi-roru"), title: "Ролл Эби Рору", description: "креветка тигровая, краб-крем, огурец, перец болгарский, салат айсберг, масаго, медовый соус 252 г"),
                    ListItem(image: #imageLiteral(resourceName: "midori"), title: "Ролл Спайси креветка", description: "лосось, сливочный сыр, огурец, масаго, креветки,s спайси соус 217 г"),
                    ListItem(image: #imageLiteral(resourceName: "dabl-unagi"), title: "Ролл Дабл унаги", description: "угорь, цыпленок, краб-крем, сливочный сыр, омлет тамаго, апельсиновый соус, спайси соус, паприка, кунжут 234 г"),
                    ListItem(image: #imageLiteral(resourceName: "midori"), title: "Ролл Мидори", description: "креветка тигровая, краб-крем, чука, масаго, яки соус, спайси соус, медовый соус 237 г")
                ]
        ]
        
        return categories
    }
}
