//
//  Person.swift
//  mvc-test
//
//  Created by Leonidas on 22/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import Foundation

class Person {
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        
        return _firstName
    }
    
    var lastName: String {
    
        return _lastName
    }
    
    init(first: String, last: String) {
        
        self._lastName = last
        self._firstName = first
    }
    
    var fullName: String {

        return "\(_firstName) \(_lastName))"
    }

}

