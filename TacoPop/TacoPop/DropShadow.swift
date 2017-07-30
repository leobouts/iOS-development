//
//  DropShadow.swift
//  TacoPop
//
//  Created by Leonidas on 30/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

protocol DropShadow {}

extension DropShadow where Self: UIView{
    
    func addDropShadow() {
        //implementation
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
    }
}
