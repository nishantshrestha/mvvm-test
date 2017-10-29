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
    
    var makeText: String?
    var modelText: String?
    var titleText: String?
    var horsepowerText: String?
    var photoURL: URL?
    
    init(car: Car) {
        self.car = car
    }
}
