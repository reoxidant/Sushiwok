//
//  DetailSushi.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 23.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var countCartItemsLabel: UILabel!
    
    private var currentCountItems = 0
    
//    @IBAction func deleteCartItemBtn(){
//        if currentCountItems > 1 {
//            currentCountItems -= 1
//            countCartItemsLabel.text = "\(currentCountItems)"
//        }
//    }
//
//    @IBAction func addCartItemBtn(){
//        if currentCountItems < 100 {
//            currentCountItems += 1
//            countCartItemsLabel.text = "\(currentCountItems)"
//            cartButton.setNewValue(value: currentCountItems)
//        }
//    }

    
    private var selectedImageView: UIImage?
    private var selectedTitleLabel: String?
    private var selectedDescriptionLabel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cartButton.rightButton.addTarget(self, action: #selector(cartAction), for: .touchUpInside)
//        navigationItem.rightBarButtonItem = cartButton
        
        if let imageToLoad = selectedImageView{
            productImageView.image = imageToLoad
        } else {
            productImageView.image = UIImage()
        }
        
        if let titleLabelToLoad = selectedTitleLabel{
            productTitleLabel.text = titleLabelToLoad
        } else {
            productTitleLabel.text = ""
        }
        
        if let descriptionLabelToLoad = selectedDescriptionLabel{
            productDescriptionLabel.text = descriptionLabelToLoad
        } else {
            productDescriptionLabel.text = ""
        }
    }
    
    @IBAction func votePressed(_ sender: UIButton) {
        
    }
    
    func setProductItem(item: Product){
        selectedImageView = UIImage(named: item.image!)
        selectedTitleLabel = item.title
        selectedDescriptionLabel = item.description
    }
    
//    @objc func cartAction(_ sender:UIBarButtonItem!){
//        showCart()
//    }
//    
//    func showCart() {
//        let cartVC = storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
//        navigationController?.pushViewController(cartVC, animated: true)
//    }
}
