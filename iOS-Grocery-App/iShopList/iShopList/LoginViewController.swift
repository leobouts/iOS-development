//
//  LoginViewController.swift
//  iShopList
//
//  Created by Leonidas on 09/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit
import KRProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBOutlet weak var signInButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        
        signInButtonOutlet.layer.cornerRadius = 8
        signInButtonOutlet.layer.borderWidth = 1
        signInButtonOutlet.layer.borderColor = UIColor.blue.cgColor
        
        signUpButtonOutlet.layer.cornerRadius = 8
        signUpButtonOutlet.layer.borderWidth = 1
        signUpButtonOutlet.layer.borderColor = UIColor.white.cgColor

     
        
        super.viewDidLoad()

      
    }

    
    //MARK: IBActions
    
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
        if emailTextField.text != "" {
            
            resetUserPassword(email: emailTextField.text!)
            
        }else{
            
            KRProgressHUD.showError(message: "Email is empty")
        }
        
    }
    
    
    @IBAction func signInButtonPressed(_ sender: Any) {
   
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            KRProgressHUD.show(message: "Signing in..")
            FUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!, completion: { (error) in
                
                if error != nil {
                    
                    KRProgressHUD.showError(message: "Error loging in")
                    return
                }
                
                self.emailTextField.text = nil
                self.passwordTextField.text = nil
                self.view.endEditing(true)
                
                self.goToApp()
                
            })
        }
        
    }
    
    
    //MARK: Go to app
    
    func goToApp() {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainView") as! UITabBarController
        
        vc.selectedIndex = 0
        self.present(vc, animated: true, completion:  nil)
    }

}
