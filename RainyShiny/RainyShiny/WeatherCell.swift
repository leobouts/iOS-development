//
//  WeatherCell.swift
//  RainyShiny
//
//  Created by Leonidas on 27/07/2017.
//  Copyright © 2017 Leonidas. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forecast: Forecast) {
        
        lowTemp.text = forecast.lowTemp+"°"
        highTemp.text = "\(forecast.highTemp)°"
        weatherType.text = "\(forecast.weatherType)"
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
}
