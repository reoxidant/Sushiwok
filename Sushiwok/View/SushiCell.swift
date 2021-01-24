//
//  SushiCell.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class SushiCell: UITableViewCell {
    
    @IBOutlet weak var sushiImageView: UIImageView!
    
    @IBOutlet weak var sushiTitleLabel: UILabel!
    
    func setSushi(sushi: Sushi){
        sushiImageView.image = sushi.image
        sushiTitleLabel.text = sushi.title
    }
    
}
