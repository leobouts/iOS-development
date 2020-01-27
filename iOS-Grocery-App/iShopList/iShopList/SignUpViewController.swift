//
//  SignUpViewController.swift
//  iShopList
//
//  Created by Leonidas on 09/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit
import KRProgressHUD

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var signInButtonOutlet: UIButton!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButtonOutlet.layer.cornerRadius = 8
        signInButtonOutlet.layer.borderWidth = 1
        signInButtonOutlet.layer.borderColor = UIColor.white.cgColor
        
        signUpButtonOutlet.layer.cornerRadius = 8
        signUpButtonOutlet.layer.borderWidth = 1
        signUpButtonOutlet.layer.borderColor = UIColor.blue.cgColor
        
        
    }

   
    //MARK: IBActions
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" && firstNameTextField.text != "" && lastNameTextField.text != ""{
            
            KRProgressHUD.show(message: "Signin up ...")
            
            FUser.registerUserWith(email: emailTextField.text!, password: passwordTextField.text!, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, completion: { (error) in
                
                if error != nil {
                    
                    KRProgressHUD.showError(message: "Error, couldnt register")
                }
                
                self.goToApp()
            })
            
        } else {
           
            KRProgressHUD.showError(message: "all field are required")
            
            
        }
    }
    
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: go to app
    
    func goToApp() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! UITabBarController
        
        vc.selectedIndex = 0
        self.present(vc, animated: true, completion:  nil)
    }
    
}
