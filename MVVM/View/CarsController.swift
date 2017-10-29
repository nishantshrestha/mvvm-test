//
//  CarsController.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import RxSwift

class CarsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cars: Variable<[CarViewModel]> = Variable((UIApplication.shared.delegate as! AppDelegate).cars)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 160.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        cars.asObservable().bind(to: tableView.rx.items(cellIdentifier: "carCell", cellType: CarTableViewCell.self)) { (index, carViewModel: CarViewModel, cell) in
            cell.carViewModel = carViewModel
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { (indexPath) in
            self.tableView.deselectRow(at: indexPath, animated: true)
            guard let detailsController = CarDetailsController.storyboardInstance() else { return }
            detailsController.carViewModel = self.cars.value[indexPath.row]
            self.navigationController?.pushViewController(detailsController, animated: true)
        }).disposed(by: disposeBag)
        
        tableView.rx.itemSelected.su
    }
    
}
