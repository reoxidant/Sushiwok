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
    
    var product: Product? = nil
    
    @IBAction func votePressed(_ sender: UIButton) {
        
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
        CartProduct.shared.doActionWith(product: product!, cartActions: .increase)
       setProductQantity(product: product!)
    }
    
    @IBAction func decreaseProductButton() {
        CartProduct.shared.doActionWith(product: product!, cartActions: .decrease)
        setProductQantity(product: product!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cartButton = CartBarButtonItem(systemName: "cart")
        cartButton.rightButton.addTarget(self, action: #selector(addToCartButtonPress), for: .touchUpInside)
        navigationItem.rightBarButtonItem = cartButton
        
        guard product != nil else {return}
        
        setupLayout()
        
        setProductQantity(product: product!)
    }
    
    private func setupLayout(){
        productImageView.image = UIImage(named: product?.image ?? "logo")
        
        let productName = product?.title ?? "shushiwok"
        let productGrams = product?.grams ?? 0
        productTitleLabel.text = "\(productName), \(productGrams) г."
        productDescriptionLabel.text = product?.description
        
        let productPrice = product?.price ?? 0
        productPriceLabel.text = String(format: "%.f ₽", productPrice)
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

    private func setProductQantity(product:Product){
        let quantity = CartProduct.shared.getQuantityProduct(product)
        quantityProduct.text = "\(quantity)"
    }
}
