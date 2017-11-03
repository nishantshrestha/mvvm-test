//
//  CommentCell.swift
//  MVVM
//
//  Created by Nishant Shrestha on 3/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    var commentViewModel: CommentViewModel? {
        didSet {
            guard let commentViewModel = commentViewModel else { return }
            usernameLabel.text = commentViewModel.commenter
            usernameLabel.sizeToFit()
            commentLabel.text = commentViewModel.body
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
