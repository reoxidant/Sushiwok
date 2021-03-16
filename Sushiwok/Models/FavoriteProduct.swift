//
//  FavoriteProduct.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 16.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation

typealias isFavorite = Bool

class FavoriteProduct{
    
    static var shared = FavoriteProduct()
    
    private var items: [(productItem: Product, isFavorite: isFavorite)] = []
    
    func getIndexProductBy(id:String) -> Int?{
        if let index = items.firstIndex(where: {$0.productItem.id == id}){
            return index
        }
        return nil
    }
    
    func add(_ productItem: Product){
        if let _ = getIndexProductBy(id: productItem.id){
            return
        }
        
        let favoriteItem = (productItem: productItem, isFavorite: true)
        items.append(favoriteItem)
    }
    
    func removeBy(id: String){
        if let index = getIndexProductBy(id: id){
            items.remove(at: index)
        }
        return
    }
}
