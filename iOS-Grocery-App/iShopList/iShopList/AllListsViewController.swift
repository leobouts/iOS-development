//
//  AllListsViewController.swift
//  iShopList
//
//  Created by Leonidas on 02/05/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit
import KRProgressHUD


class AllListsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
   
    var allLists:[ShoppingList] = []
    var nameTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        KRProgressHUD.dismiss()
        loadLists()
        
    }
    
    //MARK: TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return allLists.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!
            ListTableViewCell
        
        let shoppingList = allLists[indexPath.row]
        
        cell.bindData(item: shoppingList)
        
        return cell
    }
    //MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "ShoppingListToShoppingItemSeg", sender: indexPath)
    }
    
    //MARK: IBActions
    
    
    @IBAction func addBarButonItemPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Create Shopping List", message: "Enter the shopping list name", preferredStyle: .alert)
        
        alertController.addTextField{ (nameTextField) in
            
            nameTextField.placeholder = "Name"
            self.nameTextField = nameTextField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){ (action) in
         
            
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default){ (action) in
            
            if self.nameTextField.text != ""{
                
                self.createShoppingList()
                
            }else{
                
                KRProgressHUD.showWarning(message: "Name is empty!")
            }
            
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion:nil)

        
    }
    
    //MARK: LoadList
    
    
    func loadLists(){
        
        //.values has all the info of the child
        
        firebase.child(kSHOPPINGLIST).child(FUser.currentId()).observe(.value, with: {
            snapshot in
            
            self.allLists.removeAll()
            
            //if we actually received smthing from firebase
            
            if snapshot.exists(){
               
                let sorted = ((snapshot.value as! NSDictionary).allValues as NSArray).sortedArray(using: [NSSortDescriptor(key: kDATE,ascending: false)])
                
                for list in sorted {
                    
                    let currentList = list as! NSDictionary
                    
                    self.allLists.append(ShoppingList.init(dictionary: currentList))
                    
                }
                
            } else {
                
                print("no snapshot")
            }
            
            self.tableView.reloadData()
            
        })
       

    }
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "ShoppingListToShoppingItemSeg"{
        
            let indexPath = sender as! IndexPath
            let shoppingList = allLists[indexPath.row]
            
            let vc = segue.destination as! ShoppingItemViewController
            
            vc.shoppingList = shoppingList
        }
    }
    
    
    //MARK: Helper functions
    
    func createShoppingList(){
        
        
        let shoppingList = ShoppingList(_name: nameTextField.text!)
        
        shoppingList.saveItemInBackground(shoppingList: shoppingList){ (error) in
         
            if error != nil{
                
                KRProgressHUD.showError(message: "Error creating shopping list")
                return
                
            }
        }
    }
}
