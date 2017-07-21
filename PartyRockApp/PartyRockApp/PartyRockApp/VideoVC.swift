//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by Leonidas on 21/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    private var _partyRock: PartyRock!
    
    @IBOutlet weak var titleLbl: UILabel!
    var partyRock: PartyRock {
        
        get {
            
            return _partyRock
            
        } set {
            
            _partyRock = newValue
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
        
        
    }



}
