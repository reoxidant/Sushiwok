//
//  MenuViewController.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 25.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit
import SWRevealViewController

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var menuItems:MenuTableList?
    var newFrontViewController: UINavigationController?
    
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            
            let imageView: UIImageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleToFill
            imageView.image = #imageLiteral(resourceName: "logo")
            let headerView = UIView()
            headerView.backgroundColor = .white
            headerView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 80),
                imageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 100),
                imageView.widthAnchor.constraint(equalToConstant: 100)
            ])
            return headerView
        }
        
        return nil
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorStyle = .none
        return menuItems!.menuItemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        let bgColorView = UIView()
        bgColorView.backgroundColor = #colorLiteral(red: 0.6153318286, green: 0.8027950525, blue: 0.1735557914, alpha: 0.3020753451)
        cell.selectedBackgroundView = bgColorView
        
        cell.menuImageView.image = menuItems!.menuIconsArray[indexPath.row]
        cell.menuTitleLabel.text = menuItems!.menuItemArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealViewController:SWRevealViewController = self.revealViewController()
        
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        let mainStoryBoard:UIStoryboard = UIStoryboard(name:"Main",bundle: nil)
        
        switch cell.menuTitleLabel.text! {
        case "Menu":
            let menuListScreen = mainStoryBoard.instantiateViewController(withIdentifier: "MenuListScreen")
            newFrontViewController = UINavigationController.init(rootViewController: menuListScreen)
        case "Deals and Sales":
            let shareViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ShareViewController")
            newFrontViewController = UINavigationController.init(rootViewController:shareViewController)
        case "Favorites":
            let favoritesViewController = mainStoryBoard.instantiateViewController(withIdentifier: "FavoritesViewController")
            newFrontViewController = UINavigationController.init(rootViewController: favoritesViewController)
        case "Our Shops":
            let mapViewController = mainStoryBoard.instantiateViewController(withIdentifier: "MapViewController")
            newFrontViewController = UINavigationController.init(rootViewController: mapViewController)
        default:
            break
        }
        
        revealViewController.pushFrontViewController(newFrontViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
