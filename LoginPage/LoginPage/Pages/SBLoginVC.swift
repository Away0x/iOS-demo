//
//  SBLoginVC.swift
//  LoginPage
//
//  Created by 吴彤 on 2021/5/7.
//

import UIKit

class SBLoginVC: UIViewController {
    
    @IBOutlet weak var userNameTf: UITextField!
    @IBOutlet weak var pwdTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTf.attributedPlaceholder = NSAttributedString(string: "密码", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: userNameTf.font!,
        ])
        
        pwdTf.attributedPlaceholder = NSAttributedString(string: "QQ号/手机号/邮箱", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: pwdTf.font!,
        ])
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
