//
//  ListTableViewCell.swift
//  iShopList
//
//  Created by Leonidas on 04/05/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalItemsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func bindData(item: ShoppingList) {
        
        let currency = userDefaults.value(forKey: kCURRENCY) as! String
        
        let currentDateFormatter = dateFormatter()
        currentDateFormatter.dateFormat = "dd/MM/YYY"
        
        if item.date != nil{
            let t1=currentDateFormatter.string(from: item.date!)
            self.dateLabel.text = t1
        }
        
        self.nameLabel.text = item.name
        self.totalItemsLabel.text = "\(item.totalItems) Items"
        self.totalPriceLabel.text = "Total \(currency) \(String(format: "%.2f", item.totalPrice))"
        
        //auto resize the string so it fits the label
        self.totalPriceLabel.sizeToFit()
        self.dateLabel.sizeToFit()
        self.nameLabel.sizeToFit()
        
    }

}
