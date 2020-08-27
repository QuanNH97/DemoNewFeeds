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
    
    func insertComment(comment: Comment) {
        self.cmtImage.image = UIImage(named: comment.author.avatar)
        self.cmtAuthor.text = comment.author.name
        self.cmtContent.text = comment.content
        self.cmtTime.text = comment.postedTime / 60 == 0 ? "\(comment.postedTime) min" : "\(comment.postedTime / 60)h"
    }


}
