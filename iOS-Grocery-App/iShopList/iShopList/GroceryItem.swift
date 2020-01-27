//
//  GroceryItem.swift
//  iShopList
//
//  Created by Leonidas on 08/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import Foundation

class GroceryItem {
    
    
    var name: String
    var info: String
    var price: Float
    let ownerId: String
    var image: String
    var groceryItemId: String
    
    init(_name: String, _info: String = "", _price: Float, _image: String = "") {
        
        
        name = _name
        info = _info
        price = _price
        ownerId = FUser.currentId()
        image = _image
        groceryItemId = ""

        
    }
    
    
    //creates shopping item from this dictionary
    
    init(dictionary: NSDictionary) {
        
        name = dictionary[kNAME] as! String
        info = dictionary[kINFO] as! String
        price = dictionary[kPRICE] as! Float
        ownerId = dictionary[kOWNERID] as! String
        image = dictionary[kIMAGE] as! String
        groceryItemId = dictionary[kGROCERYITEMID] as! String
        
    }
    
    init(shoppingItem: ShoppingItem){
        
        name = shoppingItem.name
        info = shoppingItem.info
        price = shoppingItem.price
        ownerId = FUser.currentId()
        image = shoppingItem.image
        groceryItemId = ""
        
        
    }
    
    func dictionaryFromItem(item: GroceryItem) -> NSDictionary {
        
        return NSDictionary(objects: [item.name, item.info, item.price, item.ownerId, item.image, item.groceryItemId], forKeys: [kNAME as NSCopying, kINFO as NSCopying, kPRICE as NSCopying, kOWNERID as NSCopying, kIMAGE as NSCopying, kGROCERYITEMID as NSCopying])
        
    }
    
    func saveItemInBackground(groceryItem: GroceryItem, completition: @escaping(_ error: Error?) -> Void){
        
        let ref = firebase.child(kGROCERYITEM).child(FUser.currentId()).childByAutoId()
        
        groceryItem.groceryItemId = ref.key
        
        ref.setValue(dictionaryFromItem(item: groceryItem)){ (error, ref) -> Void in
            
            completition(error)
            
        }
        
    }
    
    func updateItemInBackground(groceryItem: GroceryItem, completion: @escaping(_ error: Error?) -> Void) {
        
        let ref = firebase.child(kGROCERYITEM).child(FUser.currentId()).child(groceryItem.groceryItemId)
        
        ref.setValue(dictionaryFromItem(item: groceryItem)) {
            error,ref in
            
            completion(error)
            
        }
        
        
    }
    
    func deleteItemInBackground(groceryItem: GroceryItem) {
        
        let ref = firebase.child(kGROCERYITEM).child(FUser.currentId()).child(groceryItem.groceryItemId)
        ref.removeValue()
        
    }

    
    
}
