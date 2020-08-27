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
    private var data = DataHelper().randomPost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(data.count)
        newFeedsTableView.delegate = self
        newFeedsTableView.dataSource = self
        configTable()
        registerCell()
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
    func configTable() {
        newFeedsTableView.separatorStyle = .none
        navigationItem.title = "New Feeds"
    }
    func registerCell() {
        let nib = UINib.init(nibName: "PostTableViewCell", bundle: nil)
        newFeedsTableView.register(nib, forCellReuseIdentifier: "PostTableViewCell")
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
        let cell = newFeedsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        cell.insertData(post: post)
        cell.configCell(row: indexPath.row, dataCount: data.count)
        return cell
        
    }
    
}
