//
//  File.swift
//  Weather
//
//  Created by Steve Jobs on 13/10/18.
//  Copyright © 2018 Airit Media LLP. All rights reserved.
//

import UIKit

extension UIView{
    
    func applyBorders() {

        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        
        //
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.75
        self.clipsToBounds = true
        
    }

}
