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
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    private let itemTitleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
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
    
    lazy var stackView: UIStackView = {
        let stackV = UIStackView(arrangedSubviews: [itemTitleLabel])

        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.axis = .vertical
        stackV.spacing = 10
        stackV.distribution = .fillEqually

        return stackV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            itemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            itemImageView.widthAnchor.constraint(equalToConstant: 120),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
