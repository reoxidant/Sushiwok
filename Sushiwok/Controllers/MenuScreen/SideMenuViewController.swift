//
//  MenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 25.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit
import SWRevealViewController

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var menuItems:SideMenuTableList?
    private var newFrontViewController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItems = createMenuItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = false
        self.revealViewController().view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = true
    }
    
    private func initializeSideMenu(cell:SideMenuTableViewCell){
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let mainStoryBoard:UIStoryboard = UIStoryboard(name:"Main",bundle: nil)
        let shareStoryBoard:UIStoryboard = UIStoryboard(name: "Share", bundle: nil)
        let favoritesStoryBoard:UIStoryboard = UIStoryboard(name: "Favorites", bundle: nil)
        let mapStoryBoard:UIStoryboard = UIStoryboard(name: "Map", bundle: nil)
        
        switch cell.menuTitleLabel.text! {
        case "Menu":
            let menuListScreen = mainStoryBoard.instantiateViewController(withIdentifier: "MenuListScreen")
            newFrontViewController = UINavigationController.init(rootViewController: menuListScreen)
        case "Deals and Sales":
            let shareViewController = shareStoryBoard.instantiateViewController(withIdentifier: "ShareViewController")
            newFrontViewController = UINavigationController.init(rootViewController:shareViewController)
        case "Favorites":
            let favoritesViewController = favoritesStoryBoard.instantiateViewController(withIdentifier: "FavoritesViewController")
            newFrontViewController = UINavigationController.init(rootViewController: favoritesViewController)
        case "Our Shops":
            let mapViewController = mapStoryBoard.instantiateViewController(withIdentifier: "MapViewController")
            newFrontViewController = UINavigationController.init(rootViewController: mapViewController)
        default:
            break
        }
        
        revealViewController.pushFrontViewController(newFrontViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = SideMenuHeaderView()
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorStyle = .none
        return menuItems!.menuItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! SideMenuTableViewCell
        cell.menuImageView.image = menuItems!.menuIconsArray[indexPath.row]
        cell.menuTitleLabel.text = menuItems!.menuItemArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:SideMenuTableViewCell = tableView.cellForRow(at: indexPath) as! SideMenuTableViewCell
        initializeSideMenu(cell: cell)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
