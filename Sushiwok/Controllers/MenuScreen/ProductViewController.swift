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
    
    private var quantity = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cartButton = CartBarButtonItem(systemName: "cart")
        cartButton.rightButton.addTarget(self, action: #selector(addProductToCart), for: .touchUpInside)
        navigationItem.rightBarButtonItem = cartButton
        
        setupLayout()
    }
    
    func setupLayout(){
        productImageView.image = UIImage(named: product?.image ?? "logo")
        productTitleLabel.text = product?.title ?? "Product" + ", \(product?.grams ?? 0) gram"
        productDescriptionLabel.text = product?.description
        productPriceLabel.text = String(format: "Price: £%.f", product?.price ?? 0)
    }
    
    @objc func addProductToCart(_ sender:UIBarButtonItem!){
        let cartVC = storyboard?.instantiateViewController(identifier: "CartViewController") as! CartViewController
        navigationController?.pushViewController(cartVC, animated: true)
    }

}
