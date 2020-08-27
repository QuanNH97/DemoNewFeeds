//
//  DetailViewController.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/23/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

let numberOfDisplayedComment = 2

class DetailViewController: UIViewController {
    var post = Post(author: User(name: ""), contentImage: "", contentText: "", postedTime: 0, comment: [], reactCount: 0, shareCount: 0)
    var num = numberOfDisplayedComment + 2
    @IBOutlet weak var detailPost: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailPost.delegate = self
        detailPost.dataSource = self
        detailPost.separatorStyle = .none
        title = post.author.name
        self.navigationController?.navigationBar.tintColor = .gray
        detailPost.separatorStyle = .none
        let nib = UINib.init(nibName: "PostTableViewCell", bundle: nil)
        detailPost.register(nib, forCellReuseIdentifier: "PostTableViewCell")
    }

}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == num - 1 {
            if num + 5 > post.comment.count + 1 {
                num = post.comment.count + 1
            } else {
                self.num += 5
            }
        }
        tableView.reloadData()
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = detailPost.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.insertData(post: post)
            return cell
        } else if indexPath.row == num - 1 && num != post.comment.count + 1{
            let cell = detailPost.dequeueReusableCell(withIdentifier: "moreComment", for: indexPath) as! MoreCommentTableViewCell
            return cell
        } else if indexPath.row == num - 1 && num == post.comment.count + 1 {
            let cell = detailPost.dequeueReusableCell(withIdentifier: "lastComment", for: indexPath) as! CommentTableViewCell
            let comment = post.comment[indexPath.row - 1]
            cell.insertComment(comment: comment)
            return cell
        } else {
            let cell = detailPost.dequeueReusableCell(withIdentifier: "commentList", for: indexPath) as! CommentTableViewCell
            let comment = post.comment[indexPath.row - 1]
            cell.insertComment(comment: comment)
            return cell
        }
    }
    
}
