//
//  CategoryTitleView.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 07.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CategoryTitleView: UIView {
    
    lazy var imageView:UIImageView = {
        let image = UIImageView()
        image.frame = CGRect.init(x: 0, y: 0, width: 25, height: 25)
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
        configureTitle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        addSubview(title)
//        addSubview(imageView)
    }
    
    private func configureTitle(){
        title.sizeToFit()
        title.center = center
    }


//    func setSizeImageFrame(size: (x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)){
//        imageView.frame = CGRect(x: size.x, y: size.y, width: size.width, height: size.height)
//    }
}
