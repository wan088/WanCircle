//
//  ThisPostViewController.swift
//  WanCircles
//
//  Created by Yongwan on 09/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
class ThisPostViewController: UIViewController{
    
    var post: Post?
    @IBOutlet weak var content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.content.text = post?.content
        let button = UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: <#T##Selector?#>)
    }
    @objc
    func deletePost(_sender: Any){
        Database.database().reference().child("")
    }

}
