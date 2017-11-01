//
//  PhotoExplorerController.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD

class PhotoExplorerController: UIViewController {

    var photoViewModels: Variable<[PhotoViewModel]>?
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Popular Photos"
        
        tableView.estimatedRowHeight = 160.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        guard let photoViewModels = photoViewModels else { return }
        
        bindTableView(withViewModels: photoViewModels)
        
        setupTableViewDelegates()
    }

    private func bindTableView(withViewModels viewModels: Variable<[PhotoViewModel]>) {
        viewModels.asObservable().bind(to: tableView.rx.items(cellIdentifier: "photoCell", cellType: PhotoCell.self)) { (index, photoViewModel: PhotoViewModel, cell) in
                cell.photoViewModel = photoViewModel
            }.disposed(by: disposeBag)
    }
    
    private func setupTableViewDelegates() {
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] (indexPath) in
            self?.tableView.deselectRow(at: indexPath, animated: true)
            
            // do something? - open big preview?
            SVProgressHUD.show(withStatus: "Retrieving photo details...")
            
            guard let photoViewModel = self?.photoViewModels?.value[indexPath.row] else { return }
            PhotoService().getCommentsForPhotoID(id: photoViewModel.getPhotoID(), completionHandler: { (result) in
                
                SVProgressHUD.dismiss()
                
                switch result {
                case .success(let comments):
                    comments.map { print($0.body!) }
                case .error(let message):
                    print("error: ", message)
                }
            })
        }).disposed(by: disposeBag)
    }
}

extension PhotoExplorerController {
    static func storyboardInstance() -> PhotoExplorerController? {
        let className = String(describing: self)
        return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as? PhotoExplorerController
    }
}
