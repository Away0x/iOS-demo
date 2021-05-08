//
//  SnapKitLoginVC.swift
//  LoginPage
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit
import SnapKit

class SnapKitLoginVC: UIViewController {
    
    private lazy var bgImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bg_login")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private lazy var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "login_logo")
        return iv
    }()
    
    private lazy var userNameTextField: UITextField = {
        return createTextField("QQ号/手机号/邮箱")
    }()
    
    private lazy var passwordTextField: UITextField = {
        return createTextField("密码")
    }()
    
    private var userNameStackView = UIStackView()
    private var passwordStackView = UIStackView()
    
    private lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.font = .systemFont(ofSize: 16)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(named: "main")
        btn.setTitle("登录", for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        return btn
    }()
    
    private lazy var forgetPwdStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalSpacing
        
        let l1 = UILabel()
        l1.text = "忘记密码？"
        l1.font = .systemFont(ofSize: 14)
        l1.textColor = UIColor(named: "main")
        sv.addArrangedSubview(l1)
        
        let l2 = UILabel()
        l2.text = "新用户注册"
        l2.font = .systemFont(ofSize: 14)
        l2.textColor = UIColor(named: "main")
        sv.addArrangedSubview(l2)
        
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(bgImageView)
        view.addSubview(logoImageView)
        userNameStackView = createFieldStackView(userNameTextField)
        view.addSubview(userNameStackView)
        passwordStackView = createFieldStackView(passwordTextField)
        view.addSubview(passwordStackView)
        view.addSubview(loginBtn)
        view.addSubview(forgetPwdStackView)
        
        setConstraint1()
    }
    
    private func setConstraint1() {
        // 背景图片
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().offset(0)
        }
        // logo
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(85)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(65)
        }
        // username field
        userNameStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.logoImageView.snp.bottom).offset(55)
            make.leading.equalToSuperview().offset(kLRMaring)
            make.trailing.equalToSuperview().offset(-kLRMaring)
        }
        // password field
        passwordStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.userNameStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(kLRMaring)
            make.trailing.equalToSuperview().offset(-kLRMaring)
        }
        // login button
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordStackView.snp.bottom).offset(30)
            make.height.equalTo(35)
            make.leading.equalToSuperview().offset(kLRMaring)
            make.trailing.equalToSuperview().offset(-kLRMaring)
        }
        // 忘记密码
        forgetPwdStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginBtn.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(kLRMaring)
            make.trailing.equalToSuperview().offset(-kLRMaring)
        }
    }
    
    @objc private func loginBtnClicked() {
       dismiss(animated: true)
    }
}

// MARK: - 工具方法
extension SnapKitLoginVC {
    // 创建 text field stack view
    private func createFieldStackView(_ tf: UITextField) -> UIStackView {
        let sv = UIStackView()
        sv.spacing = 5
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fill
        
        sv.addArrangedSubview(tf)
        
        let line = UIView()
        line.backgroundColor = .white
        sv.addArrangedSubview(line)
        
        tf.snp.makeConstraints { (make) in
            make.leading.equalTo(sv.snp.leading).offset(0)
            make.trailing.equalTo(sv.snp.trailing).offset(0)
            make.height.equalTo(30)
        }
        line.snp.makeConstraints { (make) in
            make.width.equalTo(sv.snp.width)
            make.height.equalTo(1)
        }
        
        return sv
    }
    
    private func createTextField(_ placeholderText: String) -> UITextField {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.textColor = .white
        // 设置 placeholder 颜色
        tf.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: tf.font!,
        ])
        return tf
    }
}
