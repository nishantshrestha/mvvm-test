//
//  CarViewModel.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

class CarViewModel {
    
    private var car: Car
    
    var makeText: String {
        return car.make
    }
    var modelText: String {
        return car.model
    }
    
    var titleText: String {
        return "\(car.make) \(car.model)"
    }
    
    var horsepowerText: String {
        return "\(car.horsepower) HP"
    }
 
    var photoURL: URL? {
        return URL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
    }
}
