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
    var numbers = ["quannh97","b","c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newFeedsTableView.delegate = self
        newFeedsTableView.dataSource = self
    }
    
}

extension NewFeedsViewController: UITableViewDelegate {}

extension NewFeedsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newFeedsTableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as! PostTableViewCell
        let newName = numbers[indexPath.row]
        cell.nameLabel.text = newName
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        return footer
    }
}
