//
//  UserViewModel.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

struct UserViewModel {
    
    private var user: Photographer
    
    let avatarURL: URL
    
    init(user: Photographer) {
        self.user = user
        
        self.avatarURL = URL(string: user.photoURL)!
    }
    
    func getUsername() -> String {
        return user.username ?? "N/A"
    }
    
    func getFullName() -> String {
        guard let firstName = user.firstName, let lastName = user.lastName else { return "" }
        return "\(firstName) \(lastName)"
    }
}
