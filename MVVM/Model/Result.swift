//
//  Result.swift
//  MVVM
//
//  Created by Nishant Shrestha on 31/10/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case error(String)
}
