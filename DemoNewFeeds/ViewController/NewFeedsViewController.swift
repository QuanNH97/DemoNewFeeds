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
        setupNavigationTitle()
        configTableView()
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
    func configTableView() {
        newFeedsTableView.delegate = self
        newFeedsTableView.dataSource = self
        newFeedsTableView.separatorStyle = .none
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        self.newFeedsTableView.contentInset = insets
    }
    func registerCell() {
        let nib = UINib.init(nibName: "PostTableViewCell", bundle: nil)
        newFeedsTableView.register(nib, forCellReuseIdentifier: "PostTableViewCell")
    }
    func setupNavigationTitle() {
        navigationItem.title = "New Feeds"
    }
}

extension NewFeedsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let
            detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController
            else { return }
        let post = data[indexPath.row]
        detailViewController.post = post
        navigationController?.pushViewController(detailViewController, animated: true)
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
        guard let
            cell = newFeedsTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell
            else { return UITableViewCell() }
        cell.configCell(post: post)
        return cell
        
    }
    
}
