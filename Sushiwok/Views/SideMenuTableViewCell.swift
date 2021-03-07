//
//  MenuTableViewCell.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 27.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCell()
    }
    
    func configureCell(){
        if isSelected{
            contentView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 0.8)
        }
        else if isHighlighted {
            contentView.backgroundColor = .white
        }
        else {
            contentView.backgroundColor = .white
        }
    }
}
