//
//  Comment.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/25/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

class Comment {
    var author: User
    var content: String
    var postedTime: Int
    init(author: User, postedTime: Int, content: String) {
        self.author = author
        self.content = content
        self.postedTime = postedTime
    }
}

