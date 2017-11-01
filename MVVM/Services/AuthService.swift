//
//  AuthService.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

protocol AuthService {
    func authenticate(username: String, password: String, completionHandler: (Result<User>) -> ())
}

struct MockAuthService: AuthService {
    func authenticate(username: String, password: String, completionHandler: (Result<User>) -> ()) {
        if username == "testuser" && password == "password" {
            completionHandler(.success(User(username: username, fullName: "Test User", lastOnline: 1509425300)))
        } else {
            completionHandler(.error("Invalid username password"))
        }
    }
}
