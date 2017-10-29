//
//  CarDetailsController.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import RxSwift

class CarDetailsController: UIViewController {

    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var powerTextField: UITextField!
    
    var carViewModel: CarViewModel?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let carViewModel = carViewModel else { return }
        
        // assign values to textfields
        carViewModel.makeText.bind(to: makeTextField.rx.text).disposed(by: disposeBag)
        carViewModel.modelText.bind(to: modelTextField.rx.text).disposed(by: disposeBag)
        carViewModel.horsepowerText.bind(to: powerTextField.rx.text).disposed(by: disposeBag)
        
        makeTextField.rx.text.orEmpty.bind(to: carViewModel.makeText).disposed(by: disposeBag)
        modelTextField.rx.text.orEmpty.bind(to: carViewModel.modelText).disposed(by: disposeBag)
        // TODO: Horsepower binding
        
        carViewModel.titleText.subscribe(onNext: { (title) in
            self.navigationItem.title = title
        }).disposed(by: disposeBag)
    }

}

extension CarDetailsController {
    static func storyboardInstance() -> CarDetailsController? {
        let className = String(describing: self)
        return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as? CarDetailsController
    }
}
