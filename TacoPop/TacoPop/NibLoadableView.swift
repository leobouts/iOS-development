//
//  NibLoadableView.swift
//  TacoPop
//
//  Created by Leonidas on 30/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
