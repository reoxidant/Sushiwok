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

class MenuScreenViewController: UIViewController {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    private let categoryMenuList = [
        PagingIndexItem(index: 0, title: "Наборы и комбо"),
        PagingIndexItem(index: 1, title: "Роллы"),
        PagingIndexItem(index: 2, title: "Wok"),
        PagingIndexItem(index: 3, title: "Суши"),
        PagingIndexItem(index: 4, title: "Pizza")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupPagingVC()
        setupSWRevealVC()
    }
    
    private func setupNavigationBar(){
        navigationItem.titleView = CategoryTitleStackView(image: #imageLiteral(resourceName: "logo"), title:"SUSHIWOK")
        
        let cartButton = CartBarButtonItem()
        cartButton.rightButton.addTarget(self, action: #selector(tappedCartButton), for: .touchUpInside)
        let orderButton = UIBarButtonItem(image: #imageLiteral(resourceName: "orders"), style: .plain, target: self, action: #selector(tappedOrderButton))
        
        navigationItem.rightBarButtonItems = [cartButton, orderButton]
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func setupPagingVC(){
        let pagingViewController = PagingViewController()
        pagingViewController.register(CategoryMenuPagingCell.self, for: PagingIndexItem.self)
        
        pagingViewController.dataSource = self
        pagingViewController.sizeDelegate = self
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        
        configurePagingViewController(PVC: pagingViewController)
        
        pagingViewController.didMove(toParent: self)
    }
    
    private func setupSWRevealVC(){
        if let revealController = self.revealViewController() {
            revealController.panGestureRecognizer()
            revealController.tapGestureRecognizer()
            self.navigationItem.leftBarButtonItem?.target = revealController
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    @objc private func tappedCartButton(_ sender:UIBarButtonItem!){
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let cartVC = storyboard.instantiateViewController(identifier: "CartViewController") as! CartViewController
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @objc private func tappedOrderButton(){
        let storyboard = UIStoryboard(name: "Orders", bundle: nil)
        let ordersVC = storyboard.instantiateViewController(identifier: "OrdersViewController") as! OrdersViewController
        present(ordersVC, animated: true, completion: nil)
    }
}

extension MenuScreenViewController: PagingViewControllerDataSource{
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return categoryMenuList.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        let vc = CategoryTableViewController()
        vc.tableViewPage = index
        vc.title = categoryMenuList[index].title
        return vc
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return categoryMenuList[index]
    }
}

extension MenuScreenViewController: PagingViewControllerSizeDelegate{
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

extension MenuScreenViewController {
    
    private func configurePagingViewController(PVC: PagingViewController){
        PVC.indicatorOptions = .hidden
        PVC.menuInsets = .init(top: 0, left: 8, bottom: 0, right: 8)
        PVC.menuItemSpacing = 8
        PVC.borderColor = .clear
        PVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            PVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            PVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            PVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            PVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
}
