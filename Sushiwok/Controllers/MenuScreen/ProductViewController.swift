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
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var quantityProduct: UILabel!
    @IBOutlet weak var favoriteProductButton: UIButton!
    
    var defaultQuantity = 1
    
    var productPrice:Int?
    
    var product: Product? = nil
    
    var tableViewPage:Int = 0
    
    var isFavorite: Bool = false {
        didSet {
            if isFavorite == true{
                favoriteProductButton.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
                favoriteProductButton.setTitle("В избраном", for: .normal)
            } else {
                favoriteProductButton.backgroundColor = #colorLiteral(red: 0.6689890623, green: 0.8319805861, blue: 0.02307102457, alpha: 1)
                favoriteProductButton.setTitle("Добавить в избранное", for: .normal)
            }
        }
    }
    
    @IBAction func votePressed() {
        isFavorite = !product!.isFavorite
        ProductApi.shared.getProductBy(page: tableViewPage, productId: product!.id)
    }
    
    @IBAction func didTapAddToCardButton() {
        if let product = product{
            CartProduct.shared.addProduct(product)
        }
    }
    
    @IBAction func didTapShowOrderHistoryButton(){
        showOrderHistoryButtonPress()
    }
    
    @IBAction func increseProductButton() {
        defaultQuantity = defaultQuantity > 0 ? defaultQuantity + 1 : defaultQuantity
        displayProductInfo()
    }
    
    @IBAction func decreaseProductButton() {
        defaultQuantity = defaultQuantity > 1 ? defaultQuantity - 1 : defaultQuantity
        displayProductInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cartButton = CartBarButtonItem(systemName: "cart")
        cartButton.rightButton.addTarget(self, action: #selector(addToCartButtonPress), for: .touchUpInside)
        navigationItem.rightBarButtonItem = cartButton
        
        guard product != nil else {return}
        
        setupLayout()
    }
    
    private func setupLayout(){
        productImageView.image = UIImage(named: product?.image ?? "logo")
        
        let productName = product?.title ?? "shushiwok"
        let productGrams = product?.grams ?? 0
        productTitleLabel.text = "\(productName), \(productGrams) г."
        productDescriptionLabel.text = product?.description
        
        productPrice = product?.price ?? 0
        productPriceLabel.text = "\(productPrice!) ₽"
        
        quantityProduct.text = "\(defaultQuantity)"
        
        isFavorite = product!.isFavorite
    }
    
    private func displayProductInfo(){
        quantityProduct.text = "\(defaultQuantity)"
        productPriceLabel.text = "\(productPrice! * defaultQuantity) ₽"
    }
    
    @objc private func addToCartButtonPress(){
        let storyboard = UIStoryboard(name: "Cart", bundle: nil)
        let cartVC = storyboard.instantiateViewController(identifier: "CartViewController") as! CartViewController
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    private func showOrderHistoryButtonPress(){
        print("show order history button press")
        //        let orderHistoryVC = storyboard?.instantiateViewController(identifier: "OrderHistoryViewController") as! OrderHistoryViewController
        //        navigationController?.pushViewController(orderHistoryVC, animated: true)
    }
}
