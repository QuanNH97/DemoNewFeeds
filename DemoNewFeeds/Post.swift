//
//  PostStruct.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/21/20.
//  Copyright © 2020 quannh. All rights reserved.
//
import Foundation

let users = ["Seri Anand", "Hector Mariano", "Shinohara Ryoma", "Yvonne Kinght"]
let fakeParam1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus hendrerit orci condimentum turpis."
let fakeParam2 = "Nam iaculis mi ac tellus viverra, ac semper nunc euismod. Nam eget lacinia augue. Duis tempus eros vitae tortor gravida, rhoncus tincidunt sapien convallis #hasgtag"
let fakeParam3 = "Integer elementum augue in mi maximus tempus. Sed cursus elementum lacus."
let paramArr = [fakeParam1, fakeParam2, fakeParam3]
let timeMinute = [15, 30, 45, 60, 120, 180, 240]
let numberOfShare = [0, 1, 2, 3]
let numberOfReact = [5, 7, 11, 13, 17, 20]
let contentImages = ["", "post1.png", "post2.png"]

func randomComment() -> Comment {
    guard
        let author = users.randomElement(),
        let content = paramArr.randomElement(),
        let time = timeMinute.randomElement()
    else {
        return Comment(cmtAuthor: User(name: ""), cmtPostedTime: 0, cmtContent: "")
    }
    return Comment(cmtAuthor: User(name: author), cmtPostedTime: time, cmtContent: content)
}
func randomPost(cmtList: [Comment]) -> Post {
    guard
        let author = users.randomElement(),
        let time = timeMinute.randomElement(),
        let content = paramArr.randomElement(),
        let image = contentImages.randomElement(),
        let react = numberOfReact.randomElement(),
        let share = numberOfShare.randomElement()
    else {
        return Post(author: User(name: ""), contentImage: "", contentText: "", postedTime: 0, comment: [], reactCount: 0, shareCount: 0)
    }
    return Post(author: User(name: author), contentImage: image, contentText: content, postedTime: time, comment: cmtList, reactCount: react, shareCount: share)
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

class Comment {
    var cmtAuthor: User
    var cmtContent: String
    var cmtPostedTime: Int
    init(cmtAuthor: User, cmtPostedTime: Int, cmtContent: String) {
        self.cmtAuthor = cmtAuthor
        self.cmtContent = cmtContent
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
            let comment = randomComment()
            comments.append(comment)
            comments.sort {
                $0.cmtPostedTime > $1.cmtPostedTime
            }
        }
        let post = randomPost(cmtList: comments)
        post.like = [0,1].randomElement()!
        posts.append(post)
    }
    posts.sort {
        $0.postedTime < $1.postedTime
    }
    return posts
}
