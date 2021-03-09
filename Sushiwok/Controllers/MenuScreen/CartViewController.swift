//
//  CartViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 02.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CartViewController: UIViewController{
    
    enum CartAction{
        case add(product: Product)
        case incrementProductCount(withProductId:Int)
        case decrementProductCount(withProductId:Int)
    }
}
