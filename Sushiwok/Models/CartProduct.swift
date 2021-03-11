//
//  CartProduct.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 08.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation

enum CartActions{
    case increase
    case decrease
    case remove
}

class CartProduct{
    
    static let shared = CartProduct()
    
    private var items: [(product: Product, quantity: Int)] = []
    
    func findProduct(_ product: Product, changeQuantity: (Int) -> Int){
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity = changeQuantity(items[index].quantity)
        }
    }
    
    func findProduct(_ product: Product, returnQuantity: (Int) -> Int) -> Int{
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            return returnQuantity(items[index].quantity)
        }
        return 0
    }
    
    func addProduct(_ product: Product){
        findProduct(product, changeQuantity: {$0 + 1})
        
        let defaultQuantity = 1
        let cartProduct = (product: product, quantity: defaultQuantity)
        items.append(cartProduct)
    }
    
    func remove(_ product: Product){
        items.removeAll(where: {$0.product.id == product.id})
    }
    
    func doActionWith(product:Product, cartActions: CartActions){
        switch cartActions {
            case .increase:
                addProduct(product)
            case .decrease:
                findProduct(product, changeQuantity: {quantity -> Int in
                    return (quantity > 1) ? quantity - 1 : quantity
                })
            case .remove:
                remove(product)
        }
    }
    
    func getQuantityProduct(_ product: Product) -> Int{
        return findProduct(product){$0}
    }
}
