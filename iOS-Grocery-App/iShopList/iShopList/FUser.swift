//
//  FUser.swift
//  iShopList
//
//  Created by Leonidas on 09/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import KRProgressHUD



class FUser{
    
    let objectId: String
    
    let createdAt: Date
    
    var email:     String
    var firstName: String
    var lastName:  String
    var fullName:  String
    
    
    init(_objectID: String, _createdAt: Date, _email: String, _firstName: String, _lastName: String){
    
        objectId = _objectID
        createdAt = _createdAt
        email = _email
        firstName = _firstName
        lastName = _lastName
        fullName = _firstName + " " + _lastName
        
        
    }
    
    init(_dictionary: NSDictionary){
        
        objectId = _dictionary[kOBJECTID] as! String
        createdAt = dateFormatter().date(from: _dictionary[kCREATEDAT] as! String)!
            
        email = _dictionary[kEMAIL] as! String
        firstName = _dictionary[kFIRSTNAME] as! String
        lastName = _dictionary[kLASTNAME] as! String
        fullName = _dictionary[kFULLNAME] as! String
        
    }
    
    //MARK: Returning current user func
    
    class func currentId() -> String {
        
        return FIRAuth.auth()!.currentUser!.uid
        
    }
    
    class func currentUser() -> FUser? {
        
        //if user is logged in
        if FIRAuth.auth()!.currentUser != nil{
            
            if let dictionary = userDefaults.object(forKey: kCURRENTUSER){
                
                return FUser.init(_dictionary: dictionary as! NSDictionary)
            }
            
        }
        
        return nil
        
    }
    
    //MARK: Login and register functions
    
    class func loginUserWith(email: String, password: String, completion: @escaping(_ error : Error?) -> Void){
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (firUser, error)in
            
            if error != nil {
                
                completion(error)
                return
            }
            
            fetchUser(userId: firUser!.uid, completion: { (succes) in
                
                if succes {
                    
                    print("user loaded succesfully")
                }
            })
            
            completion(error)
            
        })
        
    }
    
    class func registerUserWith(email: String, password: String, firstName: String, lastName: String, completion: @escaping(_ error : Error?) -> Void){
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: {(firUser, error) in
            
            if error != nil {
                
                completion(error)
                return
            }
            
            let fUser = FUser(_objectID: firUser!.uid, _createdAt: Date(), _email: firUser!.email!, _firstName: firstName, _lastName: lastName)
            
            saveUserLocally(fUser: fUser)
            saveUserInBackground(fUser: fUser)
            
            completion(error)
            
        })
        
    }
    
    
    //MARK: LogOut func
    
    class func logOutCurrentUser(withBlock: @escaping (_ success: Bool) -> Void) {
        
        userDefaults.removeObject(forKey: kCURRENTUSER)
        userDefaults.synchronize()
        
        do {
            try FIRAuth.auth()?.signOut()
            
            
            withBlock(true)
            
        } catch let error as NSError {
            withBlock(false)
            print(error.localizedDescription)
            
        }
        
        
    }
    
    
}

//MARK: save user funcs

func saveUserInBackground(fUser: FUser){
    
    let ref=firebase.child(kUSER).child(fUser.objectId)
    
    ref.setValue(userDictionaryFrom(user: fUser))
    
}

func saveUserLocally(fUser: FUser) {
    
    UserDefaults.standard.set(userDictionaryFrom(user: fUser), forKey: kCURRENTUSER)
    UserDefaults.standard.synchronize()
}

func userDictionaryFrom(user: FUser) -> NSDictionary {
    
    let createdAt = dateFormatter().string(from: user.createdAt)
    
    return NSDictionary(objects: [user.objectId,  createdAt, user.email, user.firstName, user.lastName, user.fullName], forKeys: [kOBJECTID as NSCopying, kCREATEDAT as NSCopying, kEMAIL as NSCopying, kFIRSTNAME as NSCopying, kLASTNAME as NSCopying, kFULLNAME as NSCopying])
    
}

func fetchUser(userId: String, completion: @escaping (_ success: Bool) -> Void) {
    
    firebase.child(kUSER).queryOrdered(byChild: kOBJECTID).queryEqual(toValue: userId).observe(.value, with: {
        snapshot in
        
        if snapshot.exists() {
            
            let user = ((snapshot.value as! NSDictionary).allValues as Array).first! as! NSDictionary
            
            
            UserDefaults.standard.set(user, forKey: kCURRENTUSER)
            UserDefaults.standard.synchronize()
            
            completion(true)
            
        } else {
            
            completion(false)
        }
        
    })
    
}

func resetUserPassword(email: String) {
    
    FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
        
        if error != nil {
            
            KRProgressHUD.showWarning(message: "\(error!.localizedDescription)")
            
        } else {
            
            KRProgressHUD.showSuccess(message: "Password reset email sent!")
        }
        
    })
}


func cleanupFirebaseObservers() {
    
    firebase.child(kUSER).removeAllObservers()
    firebase.child(kSHOPPINGLIST).removeAllObservers()
    firebase.child(kSHOPPINGITEM).removeAllObservers()
    firebase.child(kGROCERYITEM).removeAllObservers()
}

