//
//  DetailPostTableViewCell.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/23/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class DetailPostTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postedTimeLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var reaction: UILabel!
    @IBOutlet weak var cmtImage: UIImageView!
    @IBOutlet weak var cmtAuthor: UILabel!
    @IBOutlet weak var cmtContent: UILabel!
    @IBOutlet weak var cmtTime: UILabel!
    
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
            self.postImage.image = UIImage(named: post.contentImage)
            self.reaction.textColor = .white
        } else {
            self.reaction.textColor = .lightGray
        }
        if post.shareCount == 0 {
            self.reaction.text = "\(post.reactCount) - \(post.comment.count) comment"
        } else {
            self.reaction.text = "\(post.reactCount) - \(post.comment.count) comment - \(post.shareCount) share"
        }
        if post.postedTime / 60 == 0 {
            self.postedTimeLabel.text = "\(post.postedTime)m ago"
        } else {
            self.postedTimeLabel.text = "\(post.postedTime / 60)h ago"
        }
    }
    
    func insertComment(comment: Comment) {
        self.cmtImage.image = UIImage(named: comment.cmtAuthor.avatar) 
        self.cmtAuthor.text = comment.cmtAuthor.name
        self.cmtContent.text = comment.cmtContent
        if comment.cmtPostedTime / 60 == 0 {
            self.cmtTime.text = "\(comment.cmtPostedTime) min"
        } else {
            self.cmtTime.text = "\(comment.cmtPostedTime / 60)h"
        }
    }

}
