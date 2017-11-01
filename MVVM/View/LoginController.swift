//
//  LoginController.swift
//  MVVM
//
//  Created by Nishant Shrestha on 31/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SVProgressHUD

class LoginController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    var loginViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginViewModel = LoginViewModel(authService: MockAuthService())
        
        bindUI()
    }
    
    fileprivate func bindUI() {
        // Bind textfields
        usernameField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.username).disposed(by: disposeBag)
        passwordField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.password).disposed(by: disposeBag)
        
        // Bind button
        loginViewModel.isValid.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        loginViewModel.authenticateUser { [weak self] (result) in
            switch result {
            case .success(let user):
                print(user)
                /*
                guard let carViewController = CarsController.storyboardInstance() else { return }
                self?.navigationController?.pushViewController(carViewController, animated: true)
                 */
                
                SVProgressHUD.show(withStatus: "Fetching photos...")
                PhotoService().getPhotos { (result) in
                    switch result {
                    case .success(let photos):
                        // dismiss
                        SVProgressHUD.dismiss()
                        let viewModels = photos.map(PhotoViewModel.init)
                        guard let photosController = PhotoExplorerController.storyboardInstance() else { return }
                        photosController.photoViewModels = Variable<[PhotoViewModel]>(viewModels)
                        self?.navigationController?.pushViewController(photosController, animated: true)
                    case .error(let message):
                        print("error: ", message)
                    }
                }
            case .error(let error):
                print(error)
            }
        }
    }
}

extension LoginController {
    static func storyboardInstance() -> LoginController? {
        let className = String(describing: self)
        return UIStoryboard(name: className, bundle: nil).instantiateInitialViewController() as? LoginController
    }
}
