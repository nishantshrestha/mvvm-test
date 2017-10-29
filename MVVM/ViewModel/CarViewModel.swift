//
//  CarViewModel.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

class CarViewModel {
    
    private var car: Car?
    
    var makeText: String? {
        return car?.make
    }
    var modelText: String? {
        return car?.model
    }
    
    var titleText: String? {
        guard let make = car?.make, let model = car?.model else { return nil }
        return "\(make) \(model)"
    }
    
    var horsepowerText: String? {
        guard let horsepower = car?.horsepower else { return nil }
        return "\(horsepower) HP"
    }
 
    var photoURL: URL? {
        guard let photoURL = car?.photoURL else { return nil }
        return URL(string: photoURL)
    }
    
    init(car: Car) {
        self.car = car
    }
}
