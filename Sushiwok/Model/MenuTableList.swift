//
//  MenuTableList.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 27.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

struct MenuTableList {
    var menuItemArray = [String]()
    var menuIconsArray = [UIImage]()
}

func createMenuItems()->MenuTableList{
    return MenuTableList(
        menuItemArray:["Menu", "Deals and Sales", "Favorites", "Our Shops"],
        menuIconsArray:[
            UIImage(systemName: "book.fill")!,
            UIImage(systemName: "bubble.left.and.bubble.right.fill")!,
            UIImage(systemName: "location.fill")!,
            UIImage(systemName: "heart.fill")!
        ]
    )
}
