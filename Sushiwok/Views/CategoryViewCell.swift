//
//  CategoryMenuViewCell.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 31.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(name:String){
        self.nameLabel.text = name
    }
    
    override var isSelected: Bool {
        didSet{
            self.contentView.backgroundColor = isSelected ? #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1) : .clear
            self.nameLabel.textColor = isSelected ? .white : .black
            self.layer.borderColor = isSelected ? UIColor.clear.cgColor : UIColor.black.withAlphaComponent(0.3).cgColor
        }
    }
}
