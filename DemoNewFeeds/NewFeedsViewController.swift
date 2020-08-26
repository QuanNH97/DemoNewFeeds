//
//  ViewController.swift
//  DemoNewFeeds
//
//  Created by Quan Nguyen on 8/21/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class NewFeedsViewController: UIViewController {
    
    @IBOutlet weak var newFeedsTableView: UITableView!
    var data = randomPost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newFeedsTableView.delegate = self
        newFeedsTableView.dataSource = self
        newFeedsTableView.separatorStyle = .none
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        newFeedsTableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension NewFeedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        let post = data[indexPath.row]
        detailVC.post = post
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension NewFeedsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = data[indexPath.row]
        if indexPath.row == data.count - 1 {
            let cell = newFeedsTableView.dequeueReusableCell(withIdentifier: "lastPost", for: indexPath) as! PostTableViewCell
            cell.insertData(post: post)
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = newFeedsTableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as! PostTableViewCell
            cell.insertData(post: post)
            cell.selectionStyle = .none
            return cell
        }
    }

}
