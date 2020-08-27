//
//  CommentTableViewCell.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/26/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var cmtImage: UIImageView!
    @IBOutlet weak var cmtAuthorLabel: UILabel!
    @IBOutlet weak var cmtContentLabel: UILabel!
    @IBOutlet weak var cmtTimeLabel: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func insertComment(comment: Comment) {
        cmtImage.image = UIImage(named: comment.author.avatar)
        cmtAuthorLabel.text = comment.author.name
        cmtContentLabel.text = comment.content
        cmtTimeLabel.text = comment.postedTime / 60 == 0 ? "\(comment.postedTime) min" : "\(comment.postedTime / 60)h"
    }

}
