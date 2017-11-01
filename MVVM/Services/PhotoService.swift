//
//  PhotoService.swift
//  MVVM
//
//  Created by Nishant Shrestha on 1/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

struct PhotoService {

    func getPhotos(completionHandler: @escaping (Result<[Photo]>) -> ()) {
        let url = "https://api.500px.com/v1/photos?consumer_key=\(Constants.consumerKey)&feature=popular&image_size=600&rpp=50"
        
        Alamofire.request(url)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let data = response.data {
                        let json = JSON(data: data)
                        let photos: [Photo] = Mapper<Photo>().mapArray(JSONObject: json["photos"].arrayObject) ?? []
                        completionHandler(.success(photos))
                    }
                case .failure(let error):
                    print(error)
                    completionHandler(.error(error.localizedDescription))
                }
        }
    }
    


    func getCommentsForPhotoID(id: Int, completionHandler: @escaping (Result<[Comment]>) -> ()) {
        let url = "https://api.500px.com/v1/photos/\(id)/comments?consumer_key=\(Constants.consumerKey)"
        
        Alamofire.request(url)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    if let data = response.data {
                        let json = JSON(data: data)
                        let comments: [Comment] = Mapper<Comment>().mapArray(JSONObject: json["comments"].arrayObject) ?? []
                        
                        completionHandler(.success(comments))
                    }
                case .failure(let error):
                    completionHandler(.error(error.localizedDescription))
                }
        }
    }
}
