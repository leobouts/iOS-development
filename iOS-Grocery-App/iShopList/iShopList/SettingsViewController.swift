//
//  SettingsViewController.swift
//  iShopList
//
//  Created by Leonidas on 09/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var signOutButton: UIButton!
    
    let currencyArray = ["€", "$", "£", "¥", "₽", "HKD", "CHF", "Kč", "kr", "﷼", "₪", "₩", "Ls", "₨", "﷼"]
    
    let currencyStringArray = ["EUR, €", "USD, $", "GBP, £", "CNY, ¥", "RUB, ₽", "HKD", "CHF", "CZK, Kč", "DKK, kr", "IRR, ﷼", "ILS, ₪", "KRW, ₩", "Lat, Ls", "Rupee, ₨", "QAR, ﷼"]
    
    var currencyPicker: UIPickerView!
    var currencyString = ""
    
    override func viewWillAppear(_ animated: Bool){
        
        updateUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signOutButton.layer.cornerRadius = 8
        signOutButton.layer.borderWidth = 1
        signOutButton.layer.borderColor = UIColor.blue.cgColor
        
        currencyPicker = UIPickerView()
        currencyPicker.delegate = self
        currencyTextField.inputView = currencyPicker
        
        currencyTextField.delegate = self
    }

    
    
    
    //MARK: IBAction
    
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
    
        FUser.logOutCurrentUser { (succes) in
            
            if succes {
                
                cleanupFirebaseObservers()
                
                let loginView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomeView")
                
                self.present(loginView, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    //MARK: PickerView Data Source
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == currencyPicker {
            
            return currencyStringArray.count
            
        } else {
            
            return 0
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == currencyPicker {
            
            return currencyStringArray[row]
            
        } else {
            
            return ""
            
        }
    }
    
    //MARK: picker view delegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == currencyPicker{
            
            currencyTextField.text = currencyArray[row]
            
        }
        
        saveSettings()
        updateUI()
    }
    
    //MARK: SaveSettings
    
    func saveSettings(){
        
        userDefaults.set(currencyTextField.text!, forKey: kCURRENCY)
        userDefaults.synchronize()
    }
    
    
    //MARK: TextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == currencyTextField {
            if currencyString == "" {
                
                currencyString = currencyArray[0]
            }
            currencyTextField.text = currencyString
        }
    }
    
    
    //MARK: UpdateUI
    
    func updateUI() {
        
        currencyTextField.text = userDefaults.object(forKey: kCURRENCY) as? String
        currencyString = currencyTextField.text!
        
        
    }

    
}
