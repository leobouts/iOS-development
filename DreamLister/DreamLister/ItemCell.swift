//
//  ItemCell.swift
//  DreamLister
//
//  Created by Leonidas on 28/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit
import CoreData

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func configureCell(item: Item) {
        
        self.title.text = item.title
        self.price.text = "$\(item.price)"
        self.details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
        
    }
    
}
