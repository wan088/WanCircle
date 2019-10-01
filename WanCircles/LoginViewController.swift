//
//  ViewController.swift
//  WanCircles
//
//  Created by Yongwan on 30/09/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {
    var ref: DatabaseReference = Database.database().reference()
    @IBOutlet weak var ID_Tf: UITextField!
    @IBOutlet weak var PW_TF: UITextField!
    

    @IBAction func Login_Btn(_ sender: Any) {
        guard let email = self.ID_Tf.text else {return}
        guard let password = self.PW_TF.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            guard let strongSelf = self else { return }
            if let userInfo = user{
                strongSelf.updateInfoPlist()
                let vc = strongSelf.storyboard?.instantiateViewController(identifier: "storyboard_navi")
                UIApplication.shared.windows.first?.rootViewController = vc
            }else{
                let alert = UIAlertController(title: "로그인 오류", message: "로그인 정보를 다시 확인해주세요", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default) { (action) in
                    alert.dismiss(animated: true)
                }
                alert.addAction(ok)
                strongSelf.present(alert, animated: true)
                return
            }
        }
    }
    @IBAction func SignUp_Btn(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ID_Tf.text = "wanrage@naver.com"
        self.PW_TF.text = "123456"
        
        checkIsLogined()
    }
    func updateInfoPlist(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        ref.child("Auth/Users/\(uid)").observe(.value) { (snapshot) in
            let userDict = snapshot.value as? [String:String] ?? [:]
            UserDefaults.standard.set(userDict["Email"]!, forKey: "email")
            UserDefaults.standard.set(userDict["이름"]!, forKey: "name")
            UserDefaults.standard.set(userDict["소속"]!, forKey: "type")
            UserDefaults.standard.set(userDict["대학"]!, forKey: "univ")
        }
        
    
    }
    func checkIsLogined(){
        if let user = Auth.auth().currentUser{
            let vc = self.storyboard?.instantiateViewController(identifier: "storyboard_navi")
            UIApplication.shared.windows.first?.rootViewController = vc
        }
    }
}

