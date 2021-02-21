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
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var itemImageView:UIImageView{
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }
    
    var itemTitleLabel:UILabel{
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
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
//        contentView.addSubview(itemImageView)
        self.addSubview(cellView)
        self.addSubview(itemTitleLabel)
        
//        let views = [
//            "image":itemImageView,
//            "title":itemTitleLabel
//        ]
//
//        let verticalConstaint = NSLayoutConstraint.constraints(withVisualFormat: "V:[title]", options: [], metrics: nil, views: views)
//        let horizontalConstaint = NSLayoutConstraint.constraints(withVisualFormat: "H:[title]", options: [], metrics: nil, views: views)
//
//        contentView.addConstraints(verticalConstaint)
//        contentView.addConstraints(horizontalConstaint)
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
