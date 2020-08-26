//
//  User.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/25/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import Foundation

class User {
    var name: String
    var avatar: String
    
    init(name: String) {
        self.name = name
        self.avatar = name.replacingOccurrences(of: " ", with: "") + ".png"
    }
}
