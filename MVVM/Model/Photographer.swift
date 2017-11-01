//
//  Photographer.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import ObjectMapper

struct Photographer: Mappable {
    
    var id: Int!
    var username: String!
    var firstName: String!
    var lastName: String!
    var photoURL: String!
    var coverURL: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        username <- map["username"]
        firstName <- map["firstname"]
        lastName <- map["lastname"]
        photoURL <- map["userpic_url"]
        coverURL <- map["cover_url"]
    }
}
