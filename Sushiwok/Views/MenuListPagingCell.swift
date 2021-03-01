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
        label.textColor = .black
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.gray.cgColor
        label.layer.cornerRadius = 8
        return label
    }()
    
    private lazy var paragraphStyle: NSParagraphStyle = {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = 1
        paragraphStyle.alignment = .center
        return paragraphStyle
    }()
    
    func configureTitleLabel(){
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .clear
        titleLabel.layer.borderWidth = 1
        titleLabel.layer.borderColor = UIColor.gray.cgColor
    }
    
    func configureSelectedTitleLabel(){
        titleLabel.textColor = .white
        titleLabel.backgroundColor = #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1)
        titleLabel.layer.borderWidth = 0
        titleLabel.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            contentView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setPagingItem(_ pagingItem: PagingItem, selected: Bool, options: PagingOptions) {
        
        if let titleItem = pagingItem as? PagingIndexItem {
            let attributedString = NSMutableAttributedString(string: titleItem.title)
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            titleLabel.attributedText = attributedString
        }
        
        if selected {
            configureSelectedTitleLabel()
        } else {
            configureTitleLabel()
        }
    }
}
