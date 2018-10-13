//
//  WeatherCell.swift
//  Weather
//
//  Created by Steve Jobs on 13/10/18.
//  Copyright © 2018 Airit Media LLP. All rights reserved.
//

import UIKit
import Nuke

class WeatherCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempDayLabel: UILabel!
    
    @IBOutlet weak var cellBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cellBackgroundView.applyBorders() // Custome Methode
    }
    
    func loadCellData(data: WeatherModel) {
        
        let newDate = TimeConverter.init(date: data.date, timeZone: TimeZone.current)
        self.dateLabel.text = newDate.shortTime
        self.humidityLabel.text = data.humidity + "%"
        self.tempDayLabel.text = String(round(data.tempDay - 273.15))  + "°"
        
        let url: URL = URL(string: "\(IMAGE_PATH)\(data.icon!).png")!
        Nuke.loadImage(with: url, into: iconImage)
    }

}
