//
//  CircleView.swift
//  InnerSocial
//
//  Created by Leonidas on 01/08/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
        
        override func layoutSubviews() {
            layer.cornerRadius = self.frame.width / 2
            clipsToBounds = true
        }
}
