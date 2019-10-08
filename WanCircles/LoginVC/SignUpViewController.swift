//
//  SignUpViewcontroller.swift
//  WanCircles
//
//  Created by Yongwan on 30/09/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController{
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var Email_TF: UITextField!
    @IBOutlet weak var PassWord_TF: UITextField!
    @IBOutlet weak var PassWordCheck_TF: UITextField!
    
    @IBOutlet weak var Name_TF: UITextField!
    @IBOutlet weak var Type_SC: UISegmentedControl!
    @IBOutlet weak var Univ_TF: UITextField!
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func signUpBtn(_ sender: Any) {
        guard let email = Email_TF.text else {return}
        guard let password = PassWord_TF.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] (result, error) in
            if let _ = result{
                self?.registerInfo()
                var alert = UIAlertController(title: "회원가입 완료", message: "이제 해당 아이디로 로그인 할 수 있습니다.", preferredStyle: .alert)
                var ok = UIAlertAction(title: "확인", style: .default) { (action) in
                    self?.dismiss(animated: true)
                }
                alert.addAction(ok)
                self?.present(alert, animated: true)
            }
        }
    }
    func registerInfo(){
        let ref = Database.database().reference()
        let users = ref.child("Auth/Users")
        let uid = (Auth.auth().currentUser?.uid)!
        users.child(uid)
        let user = users.child(uid)
        var dict = [String:String]()
        dict["Email"] = (Email_TF.text)!
        dict["이름"] = (Name_TF.text)!
        dict["소속"] = (Type_SC.selectedSegmentIndex == 0 ? "작은예술" : "작은사색")
        dict["대학"] = (Univ_TF.text)!
        dict["등급"] = "일반"
        user.setValue(dict)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
