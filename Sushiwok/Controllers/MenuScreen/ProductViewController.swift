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
    
    @IBAction func votePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapAddToCardButton() {
        if let product = product{
             CartProduct.shared.addProduct(product)
        }
    }
    
    var product: Product? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cartButton = CartBarButtonItem(systemName: "cart")
        cartButton.rightButton.addTarget(self, action: #selector(addProductToCart), for: .touchUpInside)
        navigationItem.rightBarButtonItem = cartButton
        
        if product != nil {setupLayout()}
    }
    
    func setupLayout(){
        productImageView.image = UIImage(named: product?.image ?? "logo")
        
        let productName = product?.title ?? "shushiwok"
        let productGrams = product?.grams ?? 0
        productTitleLabel.text = "\(productName), \(productGrams) г."
        productDescriptionLabel.text = product?.description
        
        let productPrice = product?.price ?? 0
        productPriceLabel.text = String(format: "%.f ₽", productPrice)
        
        let quantity = CartProduct.shared.getQuantityProduct(product!)
        quantityProduct.text = "\(quantity)"
    }
    
    @objc func addProductToCart(_ sender:UIBarButtonItem!){
        let cartVC = storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        navigationController?.pushViewController(cartVC, animated: true)
    }

}
