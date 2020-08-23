//
//  PostStruct.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/21/20.
//  Copyright © 2020 quannh. All rights reserved.
//
import Foundation

let users = ["Seri Anand", "Hector Mariano", "Shinohara Ryoma", "Yvonne Kinght"]
let fakeParam = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
let timeMinute = [15, 30, 45, 60, 120, 180, 240]
let contentImages = ["", "post1.png", "post2.png"]

func randomUser() -> User {
    guard let userName = users.randomElement() else { return User(name: "") }
    let user = User(name: userName)
    return user
}

func randomPostedTime() -> Int {
    guard let minute = timeMinute.randomElement() else { return 15 }
    return minute
}

func randomPostImage() -> String {
    guard let image = contentImages.randomElement() else { return "" }
    return image
}

class Post {
    var author: User
    var postedTime: Int
    var contentText: String
    var contentImage: String
    var reactCount: Int
    var comment: [Comment]
    var shareCount: Int
    var like: Int = 0
    
    init(author: User, contentImage: String, postedTime: Int, comment: [Comment], reactCount: Int, shareCount: Int) {
        self.author = author
        self.contentText = fakeParam
        self.contentImage = contentImage
        self.reactCount = reactCount
        self.postedTime = postedTime
        self.comment = comment
        self.shareCount = shareCount
    }
    
}

class Comment {
    var cmtAuthor: User
    var cmtContent: String
    var cmtPostedTime: Int
    init(cmtAuthor: User, cmtPostedTime: Int) {
        self.cmtAuthor = cmtAuthor
        self.cmtContent = fakeParam
        self.cmtPostedTime = cmtPostedTime
    }
}

class User {
    var name: String
    var avatar: String
    
    init(name: String) {
        self.name = name
        self.avatar = name.replacingOccurrences(of: " ", with: "") + ".png"
    }
}

func initData() -> [Post] {
    var posts: [Post] = []
    for _ in 1...15 {
        var comments: [Comment] = []
        for _ in 1...15 {
            let comment = Comment(cmtAuthor: randomUser(), cmtPostedTime: randomPostedTime())
            comments.append(comment)
            comments.sort {
                $0.cmtPostedTime > $1.cmtPostedTime
            }
        }
        let post = Post(author: randomUser(), contentImage: randomPostImage(), postedTime: randomPostedTime(), comment: comments, reactCount: [7,10,13,15].randomElement()!, shareCount: [0,1,2,3].randomElement()!)
        post.like = [0,1].randomElement()!
        posts.append(post)
    }
    posts.sort {
        $0.postedTime < $1.postedTime
    }
    
    return posts
}
