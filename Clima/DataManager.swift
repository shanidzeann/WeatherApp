//
//  DataManager.swift
//  Clima
//
//  Created by Anna Shanidze on 12.12.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataManager {
    
    func updateWeatherData(json: JSON, model: WeatherDataModel, completion: @escaping (Bool) -> Void) {
        if let tempResult = json["main"]["temp"].double {
            model.temperature = Int(tempResult - 273.15)
            model.city = json["name"].stringValue
            model.condition = json["weather"][0]["id"].intValue
            model.timezone = json["timezone"].intValue
            model.weatherIconName = model.code + String((model.dayImage?.rawValue.first)!)
            completion(true)
        }
        else {
            completion(false)
        }
    }
}
