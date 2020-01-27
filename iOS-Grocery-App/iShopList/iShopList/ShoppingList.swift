//
//  ShoppinList.swift
//  iShopList
//
//  Created by Leonidas on 02/05/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import Foundation
import Firebase

class ShoppingList{
    
    let name: String
    var totalPrice: Float
    var totalItems: Int
    var id: String
    var date: Date?
    var ownerId: String
  

    init(_name: String, _totalPrice: Float = 0, _id: String = "") {
        
        name = _name
        totalPrice = _totalPrice
        totalItems = 0
        id = _id
        date = Date()
        ownerId = FUser.currentId()
        
        
  
        
    }
    
    //creates shopping list item from this dictionary
    
    init(dictionary: NSDictionary) {

        if let dictValue = dictionary[kDATE] as? String {
            if let unwrappedDate = dateFormatter().date(from: dictValue) {
                date = unwrappedDate
            }
        }
        
        name = dictionary[kNAME] as! String
        totalPrice = dictionary[kTOTALPRICE] as! Float
        totalItems = dictionary[kTOTALITEMS] as! Int
        id = dictionary[kSHOPPINGLISTID] as! String
        ownerId = dictionary[kOWNERID] as! String
        
        
    }
    
    func dictionaryFromItem(item: ShoppingList) -> NSDictionary {
        
        return NSDictionary(objects: [item.name, item.totalPrice, item.totalItems, item.id, dateFormatter().string(from: item.date!), item.ownerId], forKeys: [kNAME as NSCopying, kTOTALPRICE as NSCopying, kTOTALITEMS as NSCopying, kSHOPPINGLISTID as NSCopying, kDATE as NSCopying, kOWNERID as NSCopying])
        
    }
    
    func saveItemInBackground(shoppingList: ShoppingList, completition: @escaping(_ error: Error?) -> Void){
        
        let ref = firebase.child(kSHOPPINGLIST).child(FUser.currentId()).childByAutoId()
        
        shoppingList.id = ref.key
        
        ref.setValue(dictionaryFromItem(item: shoppingList)){ (error, ref) -> Void in
        
        completition(error)
            
        }
        
    }
    
    
    func updateItemInBackground(shoppingList: ShoppingList, completition: @escaping(_ error: Error?) -> Void) {
        
        let ref = firebase.child(kSHOPPINGLIST).child(FUser.currentId()).child(shoppingList.id)
        
        ref.setValue(dictionaryFromItem(item: shoppingList)) { (error, ref) in
            
            completition(error)
            
        }
        
    }
    
    func deleteItemInBackground(shoppingList: ShoppingList){

      let ref = firebase.child(kSHOPPINGLIST).child(FUser.currentId()).child(shoppingList.id)
      ref.removeValue()
        
    }
    
}
