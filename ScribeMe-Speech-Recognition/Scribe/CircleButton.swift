//
//  CircleButton.swift
//  Scribe
//
//  Created by Leonidas on 30/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{
            
            setupView()
            
        }
        
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        setupView()
    }
    
    func setupView() {
        
        layer.cornerRadius = cornerRadius
    }

}
