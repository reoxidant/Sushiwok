//
//  CategoryTitleView.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 07.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CategoryTitleStackView: UIStackView {
    
    lazy var imageView:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var title:UILabel = {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.textColor = .darkGray
        return label
    }()
    
    public convenience init(image: UIImage, title: String) {
        self.init(frame: .zero)
        self.title.text = title
        self.imageView.image = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addArrangedSubview(imageView)
        addArrangedSubview(title)
        axis = .horizontal
        spacing = 5
    }
    
    private func setupLayouts(){
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
