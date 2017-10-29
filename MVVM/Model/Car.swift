//
//  Car.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

class Car {
    var make: String
    var model: String
    var horsepower: Int
    var photoURL: String
    
    init(make: String, model: String, horsepower: Int, photoURL: String) {
        self.make = make
        self.model = model
        self.horsepower = horsepower
        self.photoURL = photoURL
    }
}
