//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, ChangeCityDelegate {
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = myID
    
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    let dataManager = DataManager()
    let networkManager = NetworkManager()
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func getWeatherData(params: [String : String]) {
        networkManager.getWeatherData(url: WEATHER_URL, parameters: params) { succeded, data in
            if succeded {
                self.update(with: data!)
            } else {
                self.cityLabel.text = "Connection Issues"
            }
        }
    }
    
    // MARK: - UI Updates
    
    func update(with json: JSON) {
        dataManager.updateWeatherData(json: json, model: self.weatherDataModel) { succeded in
            if succeded {
                self.cityLabel.text = self.weatherDataModel.city
                self.weatherIcon.image = UIImage(named: self.weatherDataModel.weatherIconName)
                self.temperatureLabel.text = "\(self.weatherDataModel.temperature)°"
                self.bgImageView.image = UIImage(named: self.weatherDataModel.dayImage)
            } else {
                self.cityLabel.text = "Error"
            }
        }
    }
    
    
    //MARK: - Change City Delegate methods
    
    func userEnteredANewCityName(city: String) {
        let params : [String : String] = ["q" : city, "appid" : APP_ID]
        getWeatherData(params: params)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
        }
    }
}


//MARK: - Location Manager Delegate Methods

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            getWeatherData(params: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
}

