//
//  CartProduct.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 08.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation

struct CartProduct{
    var count:Int
    var name:String
    
    init(count:Int, name:String){
        self.count = count
        self.name = name
    }
}
