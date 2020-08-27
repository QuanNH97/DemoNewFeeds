//
//  CommentTableViewCell.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/26/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var commentAuthorLabel: UILabel!
    @IBOutlet weak var commentContentLabel: UILabel!
    @IBOutlet weak var commentTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(comment: Comment) {
        selectionStyle = .none
        commentImage.image = UIImage(named: comment.author.avatar)
        commentAuthorLabel.text = comment.author.name
        commentContentLabel.text = comment.content
        commentTimeLabel.text = comment.postedTime / 60 == 0 ? "\(comment.postedTime) min" : "\(comment.postedTime / 60)h"
    }

}
