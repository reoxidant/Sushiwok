//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit
import SWRevealViewController
import SwipeMenuViewController

class MenuListScreen: SwipeMenuViewController {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    private let categoryMenuList = ["Наборы и комбо", "Роллы", "Wok", "Суши", "Pizza"]
    
    override func viewDidLoad() {
        
        for (index, categoryTitle) in categoryMenuList.enumerated() {
            let vc = ContentMenuViewController()
            vc.tableViewPage = index
            vc.title = categoryTitle
            self.addChild(vc)
        }
        
        super.viewDidLoad()
        
        var options: SwipeMenuViewOptions = .init()
        
        options.tabView.style = .flexible
        options.tabView.addition = .circle
        options.tabView.margin = 10
        options.tabView.itemView.selectedTextColor = .white
        options.tabView.itemView.font = UIFont.systemFont(ofSize: 16)
        options.tabView.itemView.margin = 10
        options.tabView.additionView.circle.cornerRadius = 10
        options.tabView.additionView.backgroundColor = #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1)

        swipeMenuView.reloadData(options: options)
        
        if let revealController = self.revealViewController() {
            revealController.panGestureRecognizer()
            revealController.tapGestureRecognizer()
            self.navigationItem.leftBarButtonItem?.target = revealController
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    // MARK: - SwipeMenuViewDelegate
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
    }
    
    
    // MARK - SwipeMenuViewDataSource
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return categoryMenuList.count
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return children[index].title ?? ""
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = children[index]
        vc.didMove(toParent: self)
        return vc
    }
}
