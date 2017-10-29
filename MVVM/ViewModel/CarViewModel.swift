//
//  CarViewModel.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CarViewModel {
    
    private var car: Car
    
    let disposeBag = DisposeBag()
    
    var makeText: BehaviorSubject<String>
    var modelText: BehaviorSubject<String>
    var horsepowerText: BehaviorSubject<String>
    var titleText: BehaviorSubject<String>
    
    var photoURL: URL? {
        return URL(string: car.photoURL)
    }
    
    init(car: Car) {
        self.car = car
        
        makeText = BehaviorSubject<String>(value: car.make)
        makeText.subscribe(onNext: { (make) in
            car.make = make
        }).disposed(by: disposeBag)
        
        modelText = BehaviorSubject<String>(value: car.model)
        modelText.subscribe(onNext: { (model) in
            car.model = model
        }).disposed(by: disposeBag)
        
        titleText = BehaviorSubject<String>(value: "\(car.make) \(car.model)")
        Observable.combineLatest([makeText, modelText]) { (carInfo) -> String in
            return "\(carInfo[0]) \(carInfo[1])"
        }.bind(to: titleText).disposed(by: disposeBag)
        
        horsepowerText = BehaviorSubject<String>(value: "\(car.horsepower) HP")
    }
}
