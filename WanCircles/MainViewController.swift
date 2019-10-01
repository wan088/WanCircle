//
//  MainViewController.swift
//  WanCircles
//
//  Created by Yongwan on 30/09/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("?")
        let logout = UIButton()
        logout.frame = CGRect(x: 100, y: 100, width: 110, height: 40)
        logout.setTitleColor(.red, for: .normal)
        logout.setTitle("로그아웃", for: .normal)
        view.addSubview(logout)
        logout.addTarget(self, action: #selector(self.logout(_:)), for: .touchUpInside)
    }
    @objc
    func logout(_ sender: Any){
        try! Auth.auth().signOut()
        UIApplication.shared.windows[0].rootViewController = storyboard?.instantiateViewController(identifier: "storyboard_login")
    }
}
