//
//  PostViewController.swift
//  WanCircles
//
//  Created by Yongwan on 02/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
class PostViewController: UIViewController {
    var boardName: String?
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var contentTF: UITextView!
    @objc
    func DoneBtn(_ sender: Any) {
        guard let title = titleTF.text else {
            return
        }
        guard let content = contentTF.text else {
            return
        }
        var tmp = Database.database().reference().child("게시글").childByAutoId()
        print(tmp.key!)
        var dict = [String:String]()
        dict["게시판명"] = boardName
        dict["제목"] = title
        dict["내용"] = content
        dict["작성자"] = UserDefaults.standard.string(forKey: "이름")
        tmp.setValue(dict)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DoneBtn(_:)))
    }
    
}
