//
//  CarTableViewCell.swift
//  MVVM
//
//  Created by Nishant Shrestha on 29/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    var carViewModel: CarViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupWithViewModel(viewModel: carViewModel)
    }
    
    private func setupWithViewModel(viewModel: CarViewModel) {
        textLabel?.text = viewModel.titleText
        detailTextLabel?.text = viewModel.horsepowerText
    }

}
