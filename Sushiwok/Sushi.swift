//
//  Sushi.swift
//  Sushiwok
//
//  Created by Виталий Шаповалов on 22.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation
import UIKit

class Sushi{
    var image:UIImage
    var title:String
    var description:String
    
    init(image:UIImage, title:String, description:String){
        self.image = image
        self.title = title
        self.description = description
    }
}
