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

class MenuCategories: UIViewController {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    private var rightBarButton: UIButton {
        get{
            let button = UIButton(frame: CGRect(x:0, y:0, width: 35, height: 35))
            button.setBackgroundImage(UIImage(systemName:"cart.fill"), for: .normal)
            button.addTarget(self, action: #selector(self.touchCartButton), for: .touchUpInside)
            return button
        }
    }
    
    @objc func touchCartButton(){
        
    }
    
    private let categoryMenuList = [
        PagingIndexItem(index: 0, title: "Наборы и комбо"),
        PagingIndexItem(index: 1, title: "Роллы"),
        PagingIndexItem(index: 2, title: "Wok"),
        PagingIndexItem(index: 3, title: "Суши"),
        PagingIndexItem(index: 4, title: "Pizza")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = createNavLogotypeWithText(text: "SUSHIWOK", image: #imageLiteral(resourceName: "logo"))
        
        let pagingViewController = PagingViewController()
        pagingViewController.register(MenuCategoriesPagingCell.self, for: PagingIndexItem.self)
        pagingViewController.dataSource = self
        pagingViewController.sizeDelegate = self
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        
        configurePagingViewController(PVC: pagingViewController)
        
        pagingViewController.didMove(toParent: self)
        
        setupSWRevealVC()
    }
    
    func createNavLogotypeWithText(text:String, image:UIImage)->UIView{
        
        let titleView = UIView()
        
        let label = UILabel()
        label.text = text
        label.sizeToFit()
        label.center = titleView.center
        label.textAlignment = NSTextAlignment.center
        label.textColor = .darkGray
        
        let imageView = UIImageView()
        imageView.image = image
        
        let imageAspect = image.size.width / image.size.height
       
        let imagePosX = label.frame.origin.x - label.frame.size.height * imageAspect
        let imagePosY = label.frame.origin.y
        
        let imageWidth = label.frame.size.height + imageAspect
        let imageHeight = label.frame.size.height
            
        
        imageView.frame = CGRect(x: imagePosX - 5, y: imagePosY, width: imageWidth, height: imageHeight)
        imageView.contentMode = .scaleAspectFill
        
        titleView.addSubview(label)
        titleView.addSubview(imageView)
        
        titleView.sizeToFit()
        
        return titleView
    }
    
    func configurePagingViewController(PVC: PagingViewController){
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
    
    func setupSWRevealVC(){
        if let revealController = self.revealViewController() {
            revealController.panGestureRecognizer()
            revealController.tapGestureRecognizer()
            self.navigationItem.leftBarButtonItem?.target = revealController
            self.navigationItem.leftBarButtonItem?.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
}

extension MenuCategories: PagingViewControllerDataSource{
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return categoryMenuList.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        let vc = CategoryItems()
        vc.tableViewPage = index
        vc.title = categoryMenuList[index].title
        return vc
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return categoryMenuList[index]
    }
}

extension MenuCategories: PagingViewControllerSizeDelegate{
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
