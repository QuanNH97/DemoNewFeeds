//
//  DataHelper.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/25/20.
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

class DataHelper {
    var posts: [Post] = []
    public func randomComment() -> [Comment] {
        var comments: [Comment] = []
        for _ in 1...15 {
            guard
                let author = users.randomElement(),
                let content = paramArr.randomElement(),
                let time = timeMinute.randomElement()
            else {
                return []
            }
            let comment = Comment(author: User(name: author), postedTime: time, content: content)
            comments.append(comment)
        }
        comments.sort {
            $0.postedTime > $1.postedTime
        }
        return comments
    }

    public func randomPost() -> [Post] {
        var posts: [Post] = []
        for _ in 1...15 {
            guard
                let author = users.randomElement(),
                let time = timeMinute.randomElement(),
                let content = paramArr.randomElement(),
                let image = contentImages.randomElement(),
                let react = numberOfReact.randomElement(),
                let share = numberOfShare.randomElement()
            else {
                return []
            }
            let post = Post(author: User(name: author), contentImage: image, contentText: content, postedTime: time, comment: randomComment(), reactCount: react, shareCount: share)
            posts.append(post)
        }
        posts.sort {
            $0.postedTime < $1.postedTime
        }
        return posts
    }
    
    init() {
        posts = randomPost()
    }

}
