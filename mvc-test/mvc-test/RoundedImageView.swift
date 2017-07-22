//
//  RoundedImageView.swift
//  mvc-test
//
//  Created by Leonidas on 22/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
