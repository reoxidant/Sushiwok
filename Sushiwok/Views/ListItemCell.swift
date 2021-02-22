//
//  SushiCell.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {
    
    static let cellIdentifier = "ListItemCell"
    
    private let itemImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    private let itemTitleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        return label
    }()
    
    var categoryItem:ListItem?{
        didSet{
            guard let item = categoryItem else {return}
            if let title = item.title{
                itemTitleLabel.text = title
            }
            if let image = item.image{
                itemImageView.image = UIImage(named: image)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemTitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            itemTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            itemTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            itemTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        
    }
}
