//
//  PostTableViewCell.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/22/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var reaction: UILabel!
    @IBOutlet weak var postedTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func insertData(post: Post) {
        self.avatarImage.image = UIImage(named: post.author.avatar)
        self.nameLabel.text = post.author.name
        self.postTextLabel.text = post.contentText
        if post.contentImage != "" {
            self.reaction.textColor = .white
            self.postImage.image = UIImage(named: post.contentImage)
        } else {
            self.reaction.textColor = .lightGray
        }
        if post.shareCount == 0 {
            self.reaction.text = "\(post.reactCount) - \(post.comment.count) comment"
        } else {
            self.reaction.text = "\(post.reactCount) - \(post.comment.count) comment - \(post.shareCount) share"
        }
        if post.postedTime / 60 == 0 {
            self.postedTimeLabel.text = "\(post.postedTime % 60)m ago"
        } else {
            self.postedTimeLabel.text = "\(post.postedTime / 60)h ago"
        }
//        if post.like == 1 {
//            self.likeButton.backgroundColor = .blue
//        } 
    }
    
}
