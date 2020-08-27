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
        setupNavigationTitle()
        configTableView()
        registerCell()
    }
    func configTableView() {
        detailPostTableView.delegate = self
        detailPostTableView.dataSource = self
        detailPostTableView.separatorStyle = .none
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        self.detailPostTableView.contentInset = insets
    }
    func registerCell() {
        let postNib = UINib.init(nibName: "CommentTableViewCell", bundle: nil)
        detailPostTableView.register(postNib, forCellReuseIdentifier: "CommentTableViewCell")
        let commentNib = UINib.init(nibName: "PostTableViewCell", bundle: nil)
        detailPostTableView.register(commentNib, forCellReuseIdentifier: "PostTableViewCell")
        let moreCommentNib = UINib.init(nibName: "MoreCommentTableViewCell", bundle: nil)
        detailPostTableView.register(moreCommentNib, forCellReuseIdentifier: "MoreCommentTableViewCell")
    }
    func setupNavigationTitle() {
        title = post.author.name
        self.navigationController?.navigationBar.tintColor = .gray
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
            guard
                let cell = detailPostTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell
                else {
                    return UITableViewCell()
            }
            cell.configCell(post: post)
            return cell
        } else if indexPath.row == num - 1 && num != post.comment.count + 1{
            guard
                let cell = detailPostTableView.dequeueReusableCell(withIdentifier: "MoreCommentTableViewCell", for: indexPath) as? MoreCommentTableViewCell
                else {
                    return UITableViewCell()
            }
            return cell
        } else {
            guard
                let cell = detailPostTableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell", for: indexPath) as? CommentTableViewCell
                else {
                    return UITableViewCell()
            }
            let comment = post.comment[indexPath.row - 1]
            cell.configCell(comment: comment)
            return cell
        }
    }
    
}
