//
//  MainViewController.swift
//  WanCircles
//
//  Created by Yongwan on 30/09/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//
import UserNotifications
import UIKit
import Firebase
import CoreLocation
class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cm = CLLocationManager().location?.coordinate
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (didAllow, error) in
            if didAllow{
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
        var button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNoticeBtn(_:)))
        self.navigationItem.rightBarButtonItem = button
        if(UserData.current.Authority! != "관리자"){
            button.isEnabled = false
        }
    }
    @objc
    func addNoticeBtn(_ sender: Any){
        let content = UNMutableNotificationContent()
        content.title = "공지확인"
        content.body = "새로운 공지사항이 올라왔으니 확인하세요."
        content.badge = 1
        let nt = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        
        let request = UNNotificationRequest(identifier: "공지", content: content, trigger: nt)
    
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error?.localizedDescription)
        }
    }

}
