//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit
import SWRevealViewController
import Parchment

class MenuListScreen: UIViewController {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    private let categoryMenuList = ["Наборы и комбо", "Роллы", "Wok", "Суши", "Pizza"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pagingViewController = PagingViewController()
        pagingViewController.dataSource = self
        pagingViewController.sizeDelegate = self
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pagingViewController.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pagingViewController.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pagingViewController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        pagingViewController.didMove(toParent: self)
        
        if let revealController = self.revealViewController() {
            revealController.panGestureRecognizer()
            revealController.tapGestureRecognizer()
            self.navigationItem.leftBarButtonItem?.target = revealController
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
}

extension MenuListScreen: PagingViewControllerDataSource{
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return categoryMenuList.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        let vc = ContentMenuViewController()
        vc.tableViewPage = index
        vc.title = categoryMenuList[index]
        return vc
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: categoryMenuList[index])
    }
}

extension MenuListScreen: PagingViewControllerSizeDelegate{
    func pagingViewController(_ pagingViewController : PagingViewController, widthForPagingItem pagingItem: PagingItem, isSelected: Bool) -> CGFloat {
        guard let item = pagingItem as? PagingIndexItem else {return 0}
        
        let insert = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: pagingViewController.options.menuItemSize.height)
        let attr = [NSAttributedString.Key.font: pagingViewController.options.font]
        
        let rect = item.title.boundingRect(with: size,
                                           options: .usesLineFragmentOrigin,
                                           attributes: attr,
                                           context: nil)
        
        let width = ceil(rect.width) + insert.left + insert.right
        
        if isSelected {
            return width * 1.5
        }else {
            return width
        }
    }
}
