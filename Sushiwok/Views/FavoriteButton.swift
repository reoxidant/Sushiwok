//
//  FavoriteButton.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 16.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class FavoriteButton: UIButton {
        
    var isFavorite: Bool = false {
        didSet {
            if isFavorite == true{
                self.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
                self.setTitle("В избраном", for: .normal)
            } else {
                self.backgroundColor = #colorLiteral(red: 0.6689890623, green: 0.8319805861, blue: 0.02307102457, alpha: 1)
                self.setTitle("Добавить в избранное", for: .normal)
                self.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
}
