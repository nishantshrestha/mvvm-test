//
//  CarsTableViewController.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit

class CarsTableViewController: UITableViewController {

    let cars: [CarViewModel] = (UIApplication.shared.delegate as! AppDelegate).cars
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension CarsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CarTableViewCell(style: .value1, reuseIdentifier: "carCell")
        let carViewModel = cars[indexPath.row]
        cell.textLabel?.text = carViewModel.titleText
        cell.detailTextLabel?.text = carViewModel.horsepowerText
        
        return cell
    }
}
