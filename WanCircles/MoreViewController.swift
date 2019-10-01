//
//  MoreViewController.swift
//  WanCircles
//
//  Created by Yongwan on 01/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class MoreViewController: UITableViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var UserInfoCell: UITableViewCell!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue시작")
        if segue.identifier == "info_setting" {
            print("?")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = UserDefaults.standard.string(forKey: "name")
    }
}
