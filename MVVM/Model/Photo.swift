//
//  Photo.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import ObjectMapper

struct Photo: Mappable {
    var id: Int!
    var name: String!
    var description: String!
    var timesViewed: Int!
    var createdAt: String!
    var isNSFW: Bool!
    var imageURL: String!
    var user: Photographer!
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        timesViewed <- map["times_viewed"]
        createdAt <- map["created_at"]
        isNSFW <- map["nsfw"]
        imageURL <- map["image_url"]
        user <- map["user"]
    }
}
