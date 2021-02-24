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
        label.numberOfLines = 2
        return label
    }()
    
    private let itemDescription:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 2
        return label
    }()
    
    private let itemGrams:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    private let itemPrice:UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.font = UIFont.systemFont(ofSize: 18)
        price.numberOfLines = 0
        return price
    }()
    
    private let choseButton:UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Выбрать", for: .normal)
        button.titleLabel?.font =  UIFont.boldSystemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 10, bottom: 5, right: 10)
        button.layer.cornerRadius = 5
        return button
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
            if let description = item.description{
                itemDescription.text = description
            }
            if let grams = item.grams{
                itemGrams.text = "\(grams) г."
            }
            if let price = item.price{
                itemPrice.text = "\(price) ₽"
            }
        }
    }
    
    lazy var horizontStackView: UIStackView = {
        let stackH = UIStackView(arrangedSubviews: [itemPrice, choseButton])
        stackH.translatesAutoresizingMaskIntoConstraints = false
        stackH.axis = .horizontal
        stackH.distribution = .equalSpacing
        return stackH
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stackV = UIStackView(arrangedSubviews: [itemTitleLabel, itemDescription, itemGrams, horizontStackView])
        
        stackV.translatesAutoresizingMaskIntoConstraints = false
        stackV.axis = .vertical
        stackV.spacing = 0
        stackV.distribution = .equalSpacing
        stackV.layoutMargins = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        stackV.isLayoutMarginsRelativeArrangement = true
        
        return stackV
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(itemImageView)
        contentView.addSubview(verticalStackView)
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
            
            verticalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 10),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
