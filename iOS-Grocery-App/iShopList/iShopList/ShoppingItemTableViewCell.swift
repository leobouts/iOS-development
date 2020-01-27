//
//  ShoppingItemTableViewCell.swift
//  iShopList
//
//  Created by Leonidas on 07/05/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit
import SwipeCellKit

class ShoppingItemTableViewCell: SwipeTableViewCell {

    
    @IBOutlet weak var quantityBackgroundView: UIView!
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var extraInfoLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.quantityBackgroundView.layer.cornerRadius = self.quantityBackgroundView.frame.width/2

    }
    
    func bindData(item: ShoppingItem) {
        
        let currency = userDefaults.value(forKey: kCURRENCY) as! String
        
        self.nameLabel.text = item.name
        self.extraInfoLabel.text = item.info
        self.quantityLabel.text = item.quantity
        self.priceLabel.text = "\(currency) \(String(format: "%.2f", item.price))"
        
        
        self.priceLabel.sizeToFit()
        self.nameLabel.sizeToFit()
        self.extraInfoLabel.sizeToFit()
        
        //add image
        
        if item.image != "" {
            
            imageFromData(pictureData: item.image, withBlock: { (image) in
            
                let newImage = image!.scaleImageToSize(newSize: itemImageView.frame.size)
                self.itemImageView.image = newImage.circleMasked
            })
            
        } else {
            
            let newImage = UIImage(named: "ShoppingCartEmpty")!.scaleImageToSize(newSize: itemImageView.frame.size)
            self.itemImageView.image = newImage.circleMasked
        }
        
    }

}
