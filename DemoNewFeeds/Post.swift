//
//  PostStruct.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/21/20.
//  Copyright © 2020 quannh. All rights reserved.
//
import Foundation

class Post {
    var author: User
    var postedTime: Int
    var contentText: String
    var contentImage: String
    var reactCount: Int
    var comment: [Comment]
    var shareCount: Int
    var like: Int = 0
    
    init(author: User, contentImage: String, contentText: String, postedTime: Int, comment: [Comment], reactCount: Int, shareCount: Int) {
        self.author = author
        self.contentText = contentText
        self.contentImage = contentImage
        self.reactCount = reactCount
        self.postedTime = postedTime
        self.comment = comment
        self.shareCount = shareCount
    }
    
}
