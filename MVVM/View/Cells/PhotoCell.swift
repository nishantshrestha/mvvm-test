//
//  PhotoCell.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class PhotoCell: UITableViewCell {

    // User details
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    // Photo
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var viewsLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var photoViewModel: PhotoViewModel? {
        didSet {
            guard let viewModel = photoViewModel else { return }
            
            photoImageView.kf.setImage(with: viewModel.photoURL)
            titleLabel.text = viewModel.titleText
            viewsLabel.text = viewModel.viewCountText()
            timeLabel.text = viewModel.uploadDateText()
            
            userImageView.kf.setImage(with: viewModel.getUserAvatarURL())
            usernameLabel.text = viewModel.getUserName()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userImageView.layer.cornerRadius = 20.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
