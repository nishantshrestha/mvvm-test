//
//  CommentViewModel.swift
//  MVVM
//
//  Created by Nishant Shrestha on 3/11/17.
//  Copyright © 2017 Nishant Shrestha. All rights reserved.
//

import Foundation

struct CommentViewModel {
    
    private var comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var commenter: String {
        return comment.user?.username ?? "unavailable-user"
    }
    
    var body: String {
        return comment.body ?? ""
    }
    
}
