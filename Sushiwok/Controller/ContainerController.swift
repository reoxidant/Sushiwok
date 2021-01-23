//
//  ContainerController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 23.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        configureHomeController()
    }
    

    //MARK: - Handlers

    func configureHomeController(){
        let homeController = HomeController()
        let controller = UINavigationController(rootViewController: homeController)
        
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    func configureMenuController(){
        
    }

}
