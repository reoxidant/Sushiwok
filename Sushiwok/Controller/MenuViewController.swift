//
//  MenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 25.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func MenuActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "menu_segue", sender: nil)
    }
    
    @IBAction func ShareActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "share_segue", sender: nil)
    }
    
    @IBAction func FavoriteActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "favorite_segue", sender: nil)
    }
    
    @IBAction func MapActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "map_segue", sender: nil)
    }
    
}
