//
//  ViewController.swift
//  mvc-test
//
//  Created by Leonidas on 22/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person = Person(first: "John", last: "Hancock")
        
        fullName.text = person.fullName
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

