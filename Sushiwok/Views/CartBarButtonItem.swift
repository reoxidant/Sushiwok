//
//  CartBarButtonItem.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 08.03.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CartBarButtonItem: UIBarButtonItem {
    
    private let badgeCount:UILabel = {
        let label = UILabel(frame: CGRect(x: 22, y: -0.5, width: 20, height: 20))
        label.layer.borderColor = UIColor.clear.cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = label.bounds.size.height / 2
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.textColor = .white
        label.font = label.font.withSize(12)
        label.backgroundColor = #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1)
        return label
    }()
    
    let rightButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
        button.setBackgroundImage(UIImage(systemName: "cart.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    init(systemName: String, count:String) {
        super.init()
        badgeCount.text = count
        rightButton.setBackgroundImage(UIImage(systemName: systemName), for: .normal)
        setViews()
    }
    
    convenience init(systemName:String?, count:String?) {
        self.init(systemName: systemName ?? "", count:count ?? "4")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViews(){
        rightButton.addSubview(badgeCount)
        customView = rightButton
    }
}
