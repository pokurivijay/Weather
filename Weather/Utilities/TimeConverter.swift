//
//  TimeConverter.swift
//  Weather
//
//  Created by Steve Jobs on 13/10/18.
//  Copyright © 2018 Airit Media LLP. All rights reserved.
//

import Foundation

struct TimeConverter {
    
    let rawDate: Double
    let timeZone: TimeZone
    
    init(date: Double, timeZone: TimeZone) {
        self.timeZone = timeZone
        self.rawDate = date
    }
    
    var shortTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = timeZone
        dateFormatter.dateFormat = "dd-mm-yyyy"
        let date = Date(timeIntervalSince1970: rawDate)
        return dateFormatter.string(from: date)
    }
}
