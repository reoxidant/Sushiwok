//
//  Test1ViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 25.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit
import SWRevealViewController

class ShareScreenViewController: UIViewController {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setMenuBtn(menuBtn)
    }
    
    // MARK: Create function for menu Action
    
    private func setMenuBtn(_ menuBar: UIBarButtonItem){
        menuBar.target = revealViewController()
        menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
    }
}
