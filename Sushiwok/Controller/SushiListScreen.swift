//
//  SushiListScreen.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class SushiListScreen: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let transition = SlideInTransition()
    
    var sushi = [Sushi]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sushi = Sushi.createSushiArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
            else {return}
        menuViewController.didTapMenuType = {menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true, completion: nil)
    }
    
    func transitionToNew(_ menuType: MenuType){
        let title = String(describing: menuType).capitalized
        self.title = title
        
        switch menuType {
        case .profile:
            //            let view = UIView()
            //            view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
            //            view.frame = self.view.bounds
            //            self.view.addSubview(view)
            print(menuType)
        case .camera:
            //            let view = UIView()
            //            view.backgroundColor = UIColor.yellow.withAlphaComponent(0.5)
            //            view.frame = self.view.bounds
            //            self.view.addSubview(view)
            print(menuType)
        default:
            break
        }
        
        
    }
}

extension SushiListScreen:UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sushi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sushiItem = sushi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SushiCell") as! SushiCell
        
        cell.setSushi(sushi: sushiItem)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sushiItem = sushi[indexPath.row]
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailSushi") as? DetailSushi {
            vc.setDetailSushi(sushi: sushiItem)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
