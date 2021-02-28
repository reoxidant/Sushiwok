//
//  MenuListPagingCell.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 28.02.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit
import Parchment

class MenuListPagingCell: PagingCell{
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.white
        label.backgroundColor = #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var paragraphStyle: NSParagraphStyle = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = 1
        paragraphStyle.alignment = .center
        return paragraphStyle
    }()
    
    func configureTitleLabel(){
        
    }
    
    func configureSelectedTitleLabel(){
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 6
        contentView.clipsToBounds = true
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: titleLabel.topAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        
        if let titleItem = pagingItem as? PagingIndexItem {
            titleLabel.attributedText = NSAttributedString(
                string: titleItem.title,
                attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
            )
        }
        
        if selected {
            configureSelectedTitleLabel()
        } else {
            configureTitleLabel()
        }
    }
}
