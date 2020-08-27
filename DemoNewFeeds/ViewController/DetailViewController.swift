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
    @IBOutlet weak var detailPostTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailPostTableView.delegate = self
        detailPostTableView.dataSource = self
        configTable()
        registerCell()
    }
    func configTable() {
        detailPostTableView.separatorStyle = .none
        title = post.author.name
        self.navigationController?.navigationBar.tintColor = .gray
    }
    func registerCell() {
        let postNib = UINib.init(nibName: "CommentTableViewCell", bundle: nil)
        detailPostTableView.register(postNib, forCellReuseIdentifier: "CommentTableViewCell")
        let commentNib = UINib.init(nibName: "PostTableViewCell", bundle: nil)
        detailPostTableView.register(commentNib, forCellReuseIdentifier: "PostTableViewCell")
        let moreCommentNib = UINib.init(nibName: "MoreCommentTableViewCell", bundle: nil)
        detailPostTableView.register(moreCommentNib, forCellReuseIdentifier: "MoreCommentTableViewCell")
        let lastCommentNib = UINib.init(nibName: "LastCommentTableViewCell", bundle: nil)
        detailPostTableView.register(lastCommentNib, forCellReuseIdentifier: "LastCommentTableViewCell")
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
            let cell = detailPostTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.insertData(post: post)
            return cell
        } else if indexPath.row == num - 1 && num != post.comment.count + 1{
            let cell = detailPostTableView.dequeueReusableCell(withIdentifier: "MoreCommentTableViewCell", for: indexPath) as! MoreCommentTableViewCell
            return cell
        } else if indexPath.row == num - 1 && num == post.comment.count + 1 {
            let cell = detailPostTableView.dequeueReusableCell(withIdentifier: "LastCommentTableViewCell", for: indexPath) as! LastCommentTableViewCell
            let comment = post.comment[indexPath.row - 1]
            cell.insertComment(comment: comment)
            return cell
        } else {
            let cell = detailPostTableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as! CommentTableViewCell
            let comment = post.comment[indexPath.row - 1]
            cell.insertComment(comment: comment)
            return cell
        }
    }
    
}
