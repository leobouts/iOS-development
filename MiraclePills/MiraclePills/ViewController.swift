//
//  ViewController.swift
//  MiraclePills
//
//  Created by Leonidas on 16/04/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var buyNow: UIButton!
    
    let states = ["Alaska","Arkansas", "Alabama","California","Maine","New York"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func stateBtnPressed(_ sender: Any) {
        buyNow.isHidden=true
        statePicker.isHidden=false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState()) //UIControlState.normal
        statePicker.isHidden = true
        buyNow.isHidden=false
    }
    
}

