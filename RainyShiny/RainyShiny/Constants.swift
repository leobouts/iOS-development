//
//  Constants.swift
//  RainyShiny
//
//  Created by Leonidas on 27/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "ffe7638ba63d9eb674d5c5cf921a79c9"

//tells our function when downloading is complete
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=ffe7638ba63d9eb674d5c5cf921a79c9"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=ffe7638ba63d9eb674d5c5cf921a79c9"
