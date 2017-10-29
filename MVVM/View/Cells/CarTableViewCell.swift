//
//  CarTableViewCell.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import RxSwift

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carTitleLabel: UILabel!
    @IBOutlet weak var carPowerLabel: UILabel!
    
    
    let disposeBag = DisposeBag()
    var carViewModel: CarViewModel? {
        didSet {
            guard let cvm = carViewModel else { return }
            
            cvm.titleText.bind(to: carTitleLabel.rx.text).disposed(by: disposeBag)
            cvm.horsepowerText.bind(to: carPowerLabel.rx.text).disposed(by: disposeBag)
            
            guard let photoURL = cvm.photoURL else { return }
            
            URLSession.shared.rx.data(request: URLRequest(url: photoURL)).subscribe(onNext: { (data) in
                DispatchQueue.main.async {
                    self.carImageView.image = UIImage(data: data)
                    self.carImageView.setNeedsLayout()
                }
            }).disposed(by: disposeBag)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
