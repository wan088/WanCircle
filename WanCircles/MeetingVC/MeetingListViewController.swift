//
//  MeetingViewController.swift
//  WanCircles
//
//  Created by Yongwan on 06/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class MeetingListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    func initUI(){
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMettingBtn(_:)))
        self.navigationItem.rightBarButtonItem = addBtn
    }
    @objc
    func addMettingBtn(_ sender: Any){
        let mvc = self.storyboard?.instantiateViewController(identifier: "tmpMeeting")
        self.show(mvc!, sender: self)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
