//
//  DetailPostTableViewCell.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/23/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class DetailPostTableViewCell: UITableViewCell {
    var post = Post(author: User(name: ""), contentImage: "", contentText: "", postedTime: 0, comment: [], reactCount: 0, shareCount: 0)

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
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var likeButton: UIButton!
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
    
    func insertData() {
        let post = self.post
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
        if post.like == 0 {
            self.likeView.backgroundColor = .white
            self.likeButton.setTitleColor(.black, for: .normal)
            self.likeButton.setImage(UIImage(named: "like contour.png"), for: .normal)
        } else {
            self.likeView.backgroundColor = UIColor(named: "likeColor")
            self.likeButton.setTitleColor(.white, for: .normal)
            self.likeButton.setImage(UIImage(named: "like.png"), for: .normal)
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
