//
//  DetailSushi.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 23.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class DetailListItem: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var selectedImageView: UIImage?
    var selectedTitleLabel: String?
    var selectedDescriptionLabel: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImageView{
            detailImageView.image = imageToLoad
        } else {
            detailImageView.image = UIImage()
        }
        
        if let titleLabelToLoad = selectedTitleLabel{
            detailTitleLabel.text = titleLabelToLoad
        } else {
            detailTitleLabel.text = ""
        }
        
        if let descriptionLabelToLoad = selectedDescriptionLabel{
            detailDescriptionLabel.text = descriptionLabelToLoad
        } else {
            detailDescriptionLabel.text = ""
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func votePressed(_ sender: UIButton) {
        
    }
    
    func setDetailListItem(item: ListItem){
        selectedImageView = item.image
        selectedTitleLabel = item.title
        selectedDescriptionLabel = item.description
    }
}
