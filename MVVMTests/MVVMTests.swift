//
//  MVVMTests.swift
//  MVVMTests
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import XCTest
@testable import MVVM

class MVVMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCarViewModelWithFerrariF12() {
        let ferrariF12 = Car(make: "Ferrari", model: "F12", horsepower: 730, photoURL: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let ferrariViewModel = CarViewModel(car: ferrariF12)
        XCTAssertEqual(ferrariViewModel.modelText, "F12")
        XCTAssertEqual(ferrariViewModel.makeText, "Ferrari")
        XCTAssertEqual(ferrariViewModel.horsepowerText, "730 HP")
        XCTAssertEqual(ferrariViewModel.photoURL, URL(string: ferrariF12.photoURL!))
        XCTAssertEqual(ferrariViewModel.titleText, "Ferrari F12")
    }
    
}
