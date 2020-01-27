//
//  AddItemViewController.swift
//  
//
//  Created by Leonidas on 06/05/2017.
//
//

import UIKit
import KRProgressHUD

class AddItemViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var itemImageView: UIImageView!
   
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var extraInfoTextField: UITextField!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    var shoppingList: ShoppingList!
    var shoppingItem : ShoppingItem?
    var groceryItem: GroceryItem?
    
    var addingToList: Bool?
    
    var itemImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "ShoppingCartEmpty")!.scaleImageToSize(newSize: itemImageView.frame.size)
        itemImageView.image = image.circleMasked
        
        if shoppingItem != nil || groceryItem != nil {
            
            updateUI()
        }
       
    }
    
    //MARK: IBAction
    
    
    @IBAction func addImageButtonPressed(_ sender: Any) {
        
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = Camera(delegate_: self)
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { (alert) in
            
            //show camera
            camera.PresentPhotoCamera(target: self, canEdit: true)
        }
        
        let sharePhoto = UIAlertAction(title: "Photo Library", style: .default) { (alert) in
         
            //show library
            camera.PresentPhotoLibrary(target: self, canEdit: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alert) in
        
            
        }
        
        optionMenu.addAction(takePhoto)
        optionMenu.addAction(sharePhoto)
        optionMenu.addAction(cancelAction)
        
        self.present(optionMenu, animated: true, completion: nil)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if nameTextField.text != "" && priceTextField.text != "" {
            
            if shoppingItem != nil || groceryItem != nil {
               
                self.updateItem()
                
            } else {
                
            saveItem()
            
            }
            
        } else {
         
            KRProgressHUD.showWarning(message: "Empty fields!")
            
        }
        
    
        
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: Saving Item
    func updateItem() {
    
        var imageData: String!
        
        if itemImage != nil {
            
            let image = UIImageJPEGRepresentation(itemImage!, 0.5)
            imageData = image?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
            
        } else {
            
            imageData = ""
            
        }
        
        if shoppingItem != nil {
            
            shoppingItem!.name  =  nameTextField.text!
            shoppingItem!.price = Float(priceTextField.text!)!
            shoppingItem!.info = extraInfoTextField.text!
            shoppingItem!.quantity = quantityTextField.text!
            
            shoppingItem!.image = imageData
            
            shoppingItem?.updateItemInBackground(shoppingItem: shoppingItem!, completion: { (error) in
                
                if error != nil{
                   
                    KRProgressHUD.showError(message: "Error updating Item")
                    return
                }
                
            })
            
        } else if groceryItem != nil {
            
            groceryItem!.name = nameTextField.text!
            groceryItem!.name  =  nameTextField.text!
            groceryItem!.price = Float(priceTextField.text!)!
            groceryItem!.info = extraInfoTextField.text!
            groceryItem!.image = imageData
            
            groceryItem!.updateItemInBackground(groceryItem: groceryItem!, completion: { (error) in
                
                if error != nil{
                    
                    KRProgressHUD.showError(message: "Error updating grocery Item")
                    return
                }
                
            })

        }
    }
    
    func saveItem(){
      
        var shoppingItem: ShoppingItem
        var imageData: String!
        
        if itemImage != nil {
            
            let image = UIImageJPEGRepresentation(itemImage!, 0.5)
            imageData = image?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
            
        } else {
            
            imageData = ""
            
        }
        
        if addingToList!{
            
            //add to groceryList only
            
            shoppingItem = ShoppingItem(_name: nameTextField.text!, _info: extraInfoTextField.text!, _price: Float (priceTextField.text!)!, _shoppingListId: "")
            
            let groceryItem = GroceryItem(shoppingItem: shoppingItem)
            groceryItem.image = imageData
            
            groceryItem.saveItemInBackground(groceryItem: groceryItem, completition:  { (error) in
                
                if error != nil {
                
                KRProgressHUD.showError(message: "Error saving grocery item")
                    
                return
                
                }
            })
            
            self.dismiss(animated: true, completion: nil)
            
        
        } else {
            
            //add to current shopping list
            
            let shoppingItem = ShoppingItem(_name: nameTextField.text!, _info: extraInfoTextField.text!, _quantity: quantityTextField.text!, _price: Float(priceTextField.text!)!, _shoppingListId: shoppingList.id)
            shoppingItem.image = imageData
            shoppingItem.saveItemInBackground(shoppingItem: shoppingItem, completition:  { (error) in
                
                if error != nil{
                    
                    KRProgressHUD.showError(message: "Error saving shopping item")
                    return
                }
            })
            
            showListNotification(shoppingItem: shoppingItem)
        }
        
     
    }
    
    func showListNotification(shoppingItem: ShoppingItem){
        
        let alertController = UIAlertController(title: "Shopping Items", message: "Do you want to add this item to your regular item list?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No", style: .cancel) { (action) in
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { (action) in
            
            //save to grocery list
            
            let groceryItem = GroceryItem(shoppingItem: shoppingItem)
            
            groceryItem.saveItemInBackground(groceryItem: groceryItem, completition: { (error) in
                
                if error != nil {
                    
                    KRProgressHUD.showError(message: "Error creating grocery item")
                    
                }
            })
            
            self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    //MARK: UIImagePickerController delegate

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.itemImage = (info[UIImagePickerControllerEditedImage] as! UIImage)
        
        let newImage = itemImage!.scaleImageToSize(newSize: itemImageView.frame.size)
        self.itemImageView.image = newImage.circleMasked
        picker.dismiss(animated: true, completion: nil)
        
        
    }

   //MARK: UpdateUI 
    
    func updateUI() {
        
        if shoppingItem != nil {
            
            self.nameTextField.text = self.shoppingItem!.name
            self.extraInfoTextField.text = self.shoppingItem!.info
            self.quantityTextField.text = self.shoppingItem!.quantity
            self.priceTextField.text = "\(self.shoppingItem!.price)"
            
            if shoppingItem!.image != "" {
                
                imageFromData(pictureData: shoppingItem!.image, withBlock: { (image) in
                    
                    self.itemImage = image!
                    let newImage = image!.scaleImageToSize(newSize: itemImageView.frame.size)
                    self.itemImageView.image = newImage.circleMasked
                    
                })
            }
            
        } else if groceryItem != nil{
                
            
            self.nameTextField.text = self.groceryItem!.name
            self.extraInfoTextField.text = self.groceryItem!.info
            self.quantityTextField.text = ""
            self.priceTextField.text = "\(self.groceryItem!.price)"
            
            if groceryItem!.image != "" {
                
                imageFromData(pictureData: groceryItem!.image, withBlock: { (image) in
                    
                    self.itemImage = image!
                    let newImage = image!.scaleImageToSize(newSize: itemImageView.frame.size)
                    self.itemImageView.image = newImage.circleMasked
                    
                })
            }

        }
    }

}
