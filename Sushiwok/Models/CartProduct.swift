//
//  CartProduct.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 08.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation

struct CartProduct{
    
    private var items: [(product: Product, quantity: Int)] = []
    
    private init(){}
    
    mutating func addProduct(product: Product){
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
            return
        }
        
        let defaultQuantity = 1
        let cartProduct = (product: product, quantity: defaultQuantity)
        items.append(cartProduct)
    }
}
