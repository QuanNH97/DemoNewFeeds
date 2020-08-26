//
//  PostTableViewCell.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/22/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    var post = Post(author: User(name: ""), contentImage: "", contentText: "", postedTime: 0, comment: [], reactCount: 0, shareCount: 0)
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var reaction: UILabel!
    @IBOutlet weak var postedTimeLabel: UILabel!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBAction func likeAction(_ sender: Any) {
        let parenTable = self.superview as! UITableView
        if self.post.like == 1 {
            self.post.like = 0
            self.post.reactCount -= 1
        } else {
            self.post.like = 1
            self.post.reactCount += 1
        }
        parenTable.reloadData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func insertData(post: Post) {
        self.post = post
        self.avatarImage.image = UIImage(named: post.author.avatar)
        self.nameLabel.text = post.author.name
        self.postTextLabel.text = post.contentText
        self.postImage.image = post.contentImage == "" ? nil : UIImage(named: post.contentImage)
        self.reaction.textColor = post.contentImage == "" ? .lightGray : .white
        self.reaction.text = post.shareCount == 0 ? "\(post.reactCount) - \(post.comment.count) comment" : "\(post.reactCount) - \(post.comment.count) comment - \(post.shareCount) share"
        self.postedTimeLabel.text = post.postedTime / 60 == 0 ? "\(post.postedTime)m ago" : "\(post.postedTime / 60)h ago"
        self.likeView.backgroundColor = post.like == 0 ? .white : UIColor(named: "likeColor")
        self.likeLabel.textColor = post.like == 0 ? .gray : .white
        self.likeImage.image = post.like == 0 ? UIImage(named: "like contour.png") : UIImage(named: "like.png")
    }
    
}
