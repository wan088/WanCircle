//
//  SignUpViewcontroller.swift
//  WanCircles
//
//  Created by Yongwan on 30/09/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController{
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var Email_TF: UITextField!
    @IBOutlet weak var PassWord_TF: UITextField!
    @IBOutlet weak var PassWordCheck_TF: UITextField!
    
    @IBOutlet weak var Name_TF: UITextField!
    @IBOutlet weak var Type_SC: UISegmentedControl!
    @IBOutlet weak var Univ_TF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
