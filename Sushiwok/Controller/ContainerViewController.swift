//
//  ContainerViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 23.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, SushiListScreenDelegate {
    
    var controller: UIViewController!
    var menuViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureSushiListScreen()
    }
    
    
    func configureSushiListScreen(){
        let sushiViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "SushiList") as! SushiListScreen
        sushiViewController.delegate = self
        controller = sushiViewController
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    func configureMenuViewController(){
        if menuViewController == nil {
            menuViewController = MenuViewController()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            print("Add a new view - menuViewController")
        }
    }
    
    //MARK: SushiListScreenDelegate

    func toggleMenu() {
        print(123)
    }
}
