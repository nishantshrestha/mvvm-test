//
//  PhotoDetailsController.swift
//  MVVM
//
//  Created by Nishant Shrestha on 3/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class PhotoDetailsController: UIViewController {
    
    // Header
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    
    // Image
    @IBOutlet var photoImageView: UIImageView!
    
    // Footer
    
    // Comments
    @IBOutlet var tableView: UITableView!
    
    var photoViewModel: Variable<PhotoViewModel>?
    var commentViewModels: Variable<[CommentViewModel]>?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Circular image
        userAvatarImageView.layer.cornerRadius = 20.0
        
        bindUI()
    }
    
    private func bindUI() {
        guard let photoViewModel = photoViewModel, let commentViewModels = commentViewModels else { return }
        
        navigationItem.title = photoViewModel.value.titleText
        photoImageView.kf.setImage(with: photoViewModel.value.photoURL)
        
        usernameLabel.text = photoViewModel.value.getUserName()
        userAvatarImageView.kf.setImage(with: photoViewModel.value.getUserAvatarURL())
        
        bindTableView(withViewModels: commentViewModels)
    }
    
    private func bindTableView(withViewModels viewModels: Variable<[CommentViewModel]>) {
        viewModels.asObservable().bind(to: tableView.rx.items(cellIdentifier: "commentCell", cellType: CommentCell.self)) {
            (index, commentViewModel: CommentViewModel, cell) in
                cell.commentViewModel = commentViewModel
        }.disposed(by: disposeBag)
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}

extension PhotoDetailsController {
    static func storyboardInstance() -> PhotoDetailsController? {
        let className = String(describing: self)
        return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as? PhotoDetailsController
    }
}