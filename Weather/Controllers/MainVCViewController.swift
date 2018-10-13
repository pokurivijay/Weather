//
//  MainVCViewController.swift
//  Weather
//
//  Created by Steve Jobs on 13/10/18.
//  Copyright © 2018 Airit Media LLP. All rights reserved.
//

import UIKit
import Nuke


class MainVCViewController: UIViewController {
    
    var weatherDataArray: [WeatherModel] = []
    var imagePath: String = ""
    
    
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var displayBackgroundView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayBackgroundView.applyBorders()
        
        ForecastData.instance.forcast16 { (result) in
            if result{
                self.weatherDataArray = ForecastData.instance.weatherDataArray
                self.displaySelectedData(data: self.weatherDataArray[0]) // Intial Data
                self.weatherTable.reloadData()
            }
        }
    }
    
    func displaySelectedData(data: WeatherModel) {
        
        self.temperatureLabel.text = String(round(data.tempDay - 273.15))  + "°"
        self.cityNameLabel.text = data.description
        
        let newDate = TimeConverter.init(date: data.date, timeZone: TimeZone.current)
        self.dateLabel.text = newDate.shortTime
        
        self.imagePath =  "\(IMAGE_PATH)\(data.icon!).png"
        
        let url: URL = URL(string: self.imagePath)!
        Nuke.loadImage(with: url, into: weatherIcon)
        
    }

}

extension MainVCViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell: WeatherCell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        // set the text from the data model
        cell.loadCellData(data: weatherDataArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.displaySelectedData(data: weatherDataArray[indexPath.row]) //Display selected Data
    }
    
    
    
}
