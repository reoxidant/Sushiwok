//
//  SideMenuHeaderView.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 06.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class SideMenuHeaderView: UIView{
    lazy var logoImageView:UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.image = #imageLiteral(resourceName: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .white
        addSubview(logoImageView)
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
