//
//  BoardViewController.swift
//  WanCircles
//
//  Created by Yongwan on 02/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
class BoardViewController: UITableViewController {
    var boardName = ""
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        postsInit()
        tableView.addSubview(UIView())
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost(_:)))
    }
    @objc
    func addPost(_ sender: Any){
        guard let vc = parent?.storyboard?.instantiateViewController(identifier: "storyboard_post") else {return}

        guard let pvc = vc as? PostViewController else {return}
        pvc.boardName = boardName
        self.show(vc, sender: self)
    }
    func postsInit(){
        let ref = Database.database().reference().child("게시글")
        ref.observe(.value) {[weak self] (snapshot) in
            var tmpPosts = [Post]()
            var values = (snapshot.value as! [String:[String:String]]).values.filter { (value) -> Bool in
                return value["게시판명"] == self?.boardName
            }
            for json in values {
                tmpPosts.append(Post(boardName: json["게시판명"]!, title: json["제목"]!, writer: json["작성자"]!, content: json["내용"]!))
            }
            
            self?.posts = tmpPosts
            self?.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") ?? UITableViewCell(style: .default, reuseIdentifier: "postCell")
        cell.textLabel?.text = posts[indexPath.row].title
        cell.textLabel?.font = .systemFont(ofSize: 20)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.posts.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = navigationController?.storyboard?.instantiateViewController(identifier: "tpvc") as? ThisPostViewController else {
            print("????")
            return
        }
        vc.post = posts[indexPath.row]
        self.show(vc, sender: self)
        
        
    }
    

}
