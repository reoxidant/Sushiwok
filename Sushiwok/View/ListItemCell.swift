//
//  SushiCell.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {
    
    @IBOutlet weak var sushiImageView: UIImageView!
    
    @IBOutlet weak var sushiTitleLabel: UILabel!
    
    func setListItem(item: ListItem){
        sushiImageView.image = item.image
        sushiTitleLabel.text = item.title
    }
    
}
