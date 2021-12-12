//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Angela Yu on 24/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import Foundation

class WeatherDataModel {
    
    var temperature = 0
    var condition = 0
    var city = ""
    var weatherIconName = ""
    var timezone = 0
    var dayImage = ""
    
    var localTime: String {
        get {
            let format = DateFormatter()
            format.timeZone = TimeZone(secondsFromGMT: timezone)
            format.dateFormat = "HH"
            let dateString = format.string(from: Date())
            let trimmedString = dateString.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
            return trimmedString
        }
    }
    
    func updateBackgroundImage(at hour: Int) -> String {
        switch hour {
        case 6...17:
            return "day"
        case 0...5, 18...23:
            return "night"
        default:
            return "dunno"
        }
    }
    
    func updateWeatherIcon(condition: Int) -> String {
    switch (condition) {
    
        case 0...300:
            return "tstorm1"
        
        case 301...500:
            return "light_rain"
        
        case 501...600:
            return "shower3"
        
        case 601...700:
            return "snow4"
        
        case 701...771:
            return "fog"
        
        case 772...799:
            return "tstorm3"
        
        case 800:
            return "sunny"
        
        case 801...804:
            return "cloudy2"
        
        case 900...903, 905...1000:
            return "tstorm3"
        
        case 903:
            return "snow5"
        
        case 904:
            return "sunny"
        
        default:
            return "dunno"
        }

    }
}
