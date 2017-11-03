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
    
    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    var photoViewModel: Variable<PhotoViewModel>?
    var commentViewModels: Variable<[CommentViewModel]>?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 50.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        bindUI()
    }
    
    private func bindUI() {
        guard let photoViewModel = photoViewModel, let commentViewModels = commentViewModels else { return }
        
        photoImageView.kf.setImage(with: photoViewModel.value.photoURL)
        
        bindTableView(withViewModels: commentViewModels)
    }
    
    private func bindTableView(withViewModels viewModels: Variable<[CommentViewModel]>) {
        viewModels.asObservable().bind(to: tableView.rx.items(cellIdentifier: "commentCell")) {
            (index, commentViewModel: CommentViewModel, cell) in
                cell.textLabel?.text = commentViewModel.commenter
                cell.detailTextLabel?.text = commentViewModel.body
        }.disposed(by: disposeBag)
    }
}

extension PhotoDetailsController {
    static func storyboardInstance() -> PhotoDetailsController? {
        let className = String(describing: self)
        return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as? PhotoDetailsController
    }
}


