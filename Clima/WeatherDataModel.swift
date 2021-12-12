//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Angela Yu on 24/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import Foundation

class WeatherDataModel {
    
    enum Day: String {
        case day = "day"
        case night = "night"
    }
    
    var temperature = 0
    var condition = 0
    var city = ""
    var weatherIconName = ""
    var timezone = 0
    
    var localTime: String {
        let format = DateFormatter()
        format.timeZone = TimeZone(secondsFromGMT: timezone)
        format.dateFormat = "HH"
        let dateString = format.string(from: Date())
        let trimmedString = dateString.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
        return trimmedString
    }
    
    var dayImage: Day? {
        switch Int(localTime)! {
        case 6...17:
            return .day
        case 0...5, 18...23:
            return .night
        default:
            return .none
        }
    }
    
    var code: String {
        switch (condition) {
        case 200...232: return "11"
        case 300...321: return "09"
        case 500...504: return "10"
        case 520...531: return "09"
        case 600...622, 511: return "13"
        case 701...781: return "50"
        case 800: return "01"
        case 801: return "02"
        case 802: return "03"
        case 803...804: return "04"
        default:
            return "0"
        }
    }
    
}
