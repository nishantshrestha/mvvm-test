//
//  LoginViewModel.swift
//  MVVM
//
//  Created by Nishant Shrestha on 31/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    
    var username = Variable<String>("")
    var password = Variable<String>("")
    
    var authService: AuthService
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(username.asObservable(), password.asObservable()) { (username, password) in
                username.characters.count > 3 && password.characters.count > 3
            }
    }
    
    func authenticateUser(completionHandler: (Result<User>) -> ()) {
        authService.authenticate(username: username.value, password: password.value) { (result) in
            completionHandler(result)
        }
    }
    
    init(authService: AuthService) {
        self.authService = authService
    }
}
