//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Leonidas on 21/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func UpdateUI(partyRock: PartyRock) {
        
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            
            do {
                
                let data = try Data(contentsOf: url)
                
                DispatchQueue.global().sync {
                    
                    self.videoPreviewImage.image = UIImage(data: data)
                    
                }
                
            } catch {
                
                //handle the error
                
            }
            
        }
        
    }
}
