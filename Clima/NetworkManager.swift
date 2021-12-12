//
//  NetworkManager.swift
//  Clima
//
//  Created by Anna Shanidze on 12.12.2021.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    func getWeatherData(url: String, parameters: [String : String], completion: @escaping (Bool, JSON?) -> Void) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            
            guard response.result.isSuccess else {
                print(response.result.error as Any)
                completion(false, nil)
                return
            }
            
            let weatherJSON: JSON = JSON(response.result.value!)
            completion(true, weatherJSON)
        }
    }
}

