//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit
import Parchment
import SWRevealViewController

class HeaderPagingView: PagingView{
    
    static let HeaderHeight: CGFloat = 200
    
    var headerHeightConstraint: NSLayoutConstraint?
    
    private lazy var headerView: UIImageView = {
        let view = UIImageView(image: UIImage())
        view.contentMode = .scaleAspectFill
        return view
    }
    
}

class MenuListScreen: UIViewController {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    private let categoryMenuList = ["Наборы и комбо", "Роллы", "Wok", "Суши", "Pizza"]
    
    var viewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        
        for (index, categoryTitle) in categoryMenuList.enumerated() {
            let vc = ContentMenuViewController()
            vc.tableViewPage = index
            vc.title = categoryTitle
            viewControllers.append(vc)
        }
        
        super.viewDidLoad()
        
        let pagingViewController = PagingViewController()
        pagingViewController.dataSource = self
        pagingViewController.select(index: 0)
        
//        addChild(pagingViewController)
//        view.addSubview(pagingViewController.view)
//        pagingViewController.didMove(toParent: self)
//        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
//
//        pagingViewController.dataSource = self
//        pagingViewController.select(index: 0)
//
        NSLayoutConstraint.activate([
            pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])


        
        //        NSLayoutConstraint.activate([
        //            pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //            pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        //            pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
        //            pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        //        ])
        
        
        //        var options: SwipeMenuViewOptions = .init()
        //
        //        options.tabView.addition = .circle
        //        options.tabView.margin = 8
        //        options.tabView.height = 45
        //        options.tabView.itemView.selectedTextColor = .white
        //        options.tabView.itemView.font = UIFont.systemFont(ofSize: 16)
        //        options.tabView.itemView.margin = 8
        //        options.tabView.itemView.textColor = .black
        //        options.tabView.additionView.circle.cornerRadius = 8
        //        options.tabView.additionView.padding = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        //        options.tabView.additionView.backgroundColor = #colorLiteral(red: 0.6156862745, green: 0.8039215686, blue: 0.168627451, alpha: 1)
        
        //        swipeMenuView.reloadData(options: options)
        //
        //        if let revealController = self.revealViewController() {
        //            revealController.panGestureRecognizer()
        //            revealController.tapGestureRecognizer()
        //            self.navigationItem.leftBarButtonItem?.target = revealController
        //            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
        //        }
        
    }
    
    //    // MARK: - SwipeMenuViewDelegate
    //    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
    //        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
    //    }
    //
    //    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
    //        super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
    //    }
    //
    //    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
    //        super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
    //    }
    //
    //    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
    //        super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
    //    }
    //
    //
    //    // MARK - SwipeMenuViewDataSource
    //    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
    //        return categoryMenuList.count
    //    }
    //
    //    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
    //        return children[index].title ?? ""
    //    }
    //
    //    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
    //        let vc = children[index]
    //        vc.didMove(toParent: self)
    //        return vc
    //    }
}

extension MenuListScreen: PagingViewControllerDataSource{
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return categoryMenuList.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        let viewController:UIViewController? = viewControllers[index]
        return viewController ?? UIViewController()
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: categoryMenuList[index])
    }
}
