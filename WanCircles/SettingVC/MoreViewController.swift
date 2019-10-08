//
//  MoreViewController.swift
//  WanCircles
//
//  Created by Yongwan on 01/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
import CoreBluetooth
class MoreViewController: UITableViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var UserInfoCell: UITableViewCell!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Info_Setting" {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.text = UserData.current.Name
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1 && indexPath.row == 0){
            logout()
            
        }
    }
    func logout(){
        UserData.current.Email = ""
        UserData.current.Name = ""
        UserData.current.Univ = ""
        UserData.current.Belong = ""
        
        try! Auth.auth().signOut()
        UIApplication.shared.windows[0].rootViewController = storyboard?.instantiateViewController(identifier: "storyboard_login")
    }
}
