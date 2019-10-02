//
//  MoreViewController.swift
//  WanCircles
//
//  Created by Yongwan on 01/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
class MoreViewController: UITableViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var UserInfoCell: UITableViewCell!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Info_Setting" {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = UserDefaults.standard.string(forKey: "name")
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1 && indexPath.row == 0){
            logout()
        }
    }
    func logout(){
        UserDefaults.standard.set("", forKey: "Email")
        UserDefaults.standard.set("", forKey: "이름")
        UserDefaults.standard.set("", forKey: "소속")
        UserDefaults.standard.set("", forKey: "대학")
        try! Auth.auth().signOut()
        UIApplication.shared.windows[0].rootViewController = storyboard?.instantiateViewController(identifier: "storyboard_login")
    }
}
