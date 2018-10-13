//
//  ForecastData.swift
//  Weather
//
//  Created by Steve Jobs on 13/10/18.
//  Copyright © 2018 Airit Media LLP. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ForecastData {
    
    static let instance = ForecastData()
    
    var weatherDataArray = [WeatherModel]()
    private let defaultTimeZone = TimeZone.current
    
    
    func forcast16(completion: @escaping CompletionHandler) {
        
        let URL = "https://samples.openweathermap.org/data/2.5/forecast/daily?q=Philadelphia&appid=72b608bbf63adef1f8c496958efe94b5"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                let json = try! JSON(data: data)
                    for item in json["list"] {
                        
                        let tempDay = item.1["temp"]["day"].double
                        let humidity = item.1["humidity"].stringValue
                        let description = item.1["weather"][0]["description"].stringValue
                        let icon = item.1["weather"][0]["icon"].stringValue
                        let date = item.1["dt"].double
                        
//                        let newDate = TimeConverter.init(date: date!, timeZone: self.defaultTimeZone)
                        


                        let weatherData = WeatherModel(tempDay: tempDay, humidity: humidity, description: description, icon: icon, date: date)

                        self.weatherDataArray.append(weatherData)
                    }
                    completion(true)

            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }    
}
