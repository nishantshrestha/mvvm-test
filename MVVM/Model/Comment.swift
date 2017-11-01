//
//  Comments.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import ObjectMapper

struct Comment: Mappable {
    
    var id: Int?
    var userID: Int?
    var body: String?
    var createdAt: String?
    var user: Photographer?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        userID <- map["user_id"]
        body <- map["body"]
        createdAt <- map["created_at"]
        user <- map["user"]
    }
}
