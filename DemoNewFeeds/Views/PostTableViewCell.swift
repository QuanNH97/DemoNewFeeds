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
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var reactionLabel: UILabel!
    @IBOutlet weak var postedTimeLabel: UILabel!
    @IBOutlet weak var likeView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(post: Post) {
        selectionStyle = .none
        self.post = post
        avatarImageView.image = UIImage(named: post.author.avatar)
        nameLabel.text = post.author.name
        postTextLabel.text = post.contentText
        postImageView.image = post.contentImage == "" ? nil : UIImage(named: post.contentImage)
        reactionLabel.textColor = post.contentImage == "" ? .lightGray : .white
        reactionLabel.text = post.reactionString()
        postedTimeLabel.text = post.postedTime / 60 == 0 ? "\(post.postedTime)m ago" : "\(post.postedTime / 60)h ago"
        likeView.backgroundColor = post.like == 0 ? .white : UIColor(named: "likeColor")
        likeLabel.textColor = post.like == 0 ? .gray : .white
        likeImageView.image = post.like == 0 ? UIImage(named: "like contour.png") : UIImage(named: "like.png")
    }
    
    @IBAction func likeAction(_ sender: Any) {
        guard let parenTable = superview as? UITableView
            else { return }
        if post.like == 1 {
            post.like = 0
            post.reactCount -= 1
        } else {
            post.like = 1
            post.reactCount += 1
        }
        parenTable.reloadData()
    }
}
