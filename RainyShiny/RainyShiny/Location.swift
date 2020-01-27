//
//  Location.swift
//  RainyShiny
//
//  Created by Leonidas on 27/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
