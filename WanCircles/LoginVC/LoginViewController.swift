//
//  ViewController.swift
//  WanCircles
//
//  Created by Yongwan on 30/09/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import Firebase
import RxSwift
import RxCocoa
class LoginViewController: UIViewController {
    var ref: DatabaseReference = Database.database().reference()
    @IBOutlet weak var ID_Tf: UITextField!
    @IBOutlet weak var PW_TF: UITextField!
    var permitted = BehaviorRelay<Int>(value: 0)
    @IBAction func Login_Btn(_ sender: Any) {
        guard let email = self.ID_Tf.text else {return}
        guard let password = self.PW_TF.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            guard let strongSelf = self else { return }
            if user != nil{
                guard let uid = Auth.auth().currentUser?.uid else {return}
                strongSelf.updateInfoPlist(uid: uid) { isDone in
                    if(isDone){
                        guard let vc = strongSelf.storyboard?.instantiateViewController(identifier: "storyboard_navi") else {return}
                        UIApplication.shared.windows.first?.rootViewController = vc
                    }else{
                        strongSelf.loginErrorAlert()
                        Auth.auth().currentUser?.delete(completion: { (error) in
                            print(error?.localizedDescription)
                        })
                    }
                }
            }
        }
    }
    func loginErrorAlert(){
        let alert = UIAlertController(title: "로그인 오류", message: "로그인 정보를 다시 확인해주세요", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default) { (action) in
            alert.dismiss(animated: true)
        }
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    @IBAction func SignUp_Btn(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ID_Tf.text = "wanrage@naver.com"
        self.PW_TF.text = "123456"
        
        checkIsLogined()
    }
    func updateInfoPlist(uid: String, completion: @escaping (Bool)->())-> Bool{
        
        var check = true;
        
        ref.child("Auth/Users/\(uid)").observe(.value) { (snapshot) in
                guard let userDict = snapshot.value as? [String:String] else {
                    check = false;
                    print("this")
                    completion(false)
                    return
                }
                print("what")
                UserData.current.Email = userDict["Email"]!
                UserData.current.Name = userDict["이름"]!
                UserData.current.Belong = userDict["소속"]!
                UserData.current.Univ = userDict["대학"]!
                UserData.current.Authority = userDict["등급"]!
                completion(true)
        }
        print(check)
        return check;
    }
    func checkIsLogined(){
        if let user = Auth.auth().currentUser{
            guard let vc = self.storyboard?.instantiateViewController(identifier: "storyboard_navi") else {return}
            view.window?.rootViewController = vc
            //UIApplication.shared.windows.first?.rootViewController = vc
        }
    }
}


