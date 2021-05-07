//
//  CodeLoginVC.swift
//  LoginPage
//
//  Created by 吴彤 on 2021/5/7.
//

import UIKit

let kLRMaring: CGFloat = 24

class CodeLoginVC: UIViewController {
    
    private lazy var bgImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "bg_login")
        iv.contentMode = .scaleToFill
        return iv
    }()
    
    private lazy var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
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
        btn.translatesAutoresizingMaskIntoConstraints = false
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
        sv.translatesAutoresizingMaskIntoConstraints = false
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
        
        setConstraint()
    }

    private func setConstraint() {
        NSLayoutConstraint.activate([
            // 背景图片
            bgImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            bgImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            bgImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            // logo
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 85),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 65),
            // username field
            userNameStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 55),
            userNameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: kLRMaring),
            userNameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -kLRMaring),
            // password field
            passwordStackView.topAnchor.constraint(equalTo: userNameStackView.bottomAnchor, constant: 10),
            passwordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: kLRMaring),
            passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -kLRMaring),
            // login button
            loginBtn.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 30),
            loginBtn.heightAnchor.constraint(equalToConstant: 35),
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: kLRMaring),
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -kLRMaring),
            // 忘记密码
            forgetPwdStackView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 12),
            forgetPwdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: kLRMaring),
            forgetPwdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -kLRMaring),
        ])
    }
    
    @objc private func loginBtnClicked() {
       dismiss(animated: true)
    }
}

// MARK: - 工具方法
extension CodeLoginVC {
    // 创建 text field stack view
    private func createFieldStackView(_ tf: UITextField) -> UIStackView {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 5
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .fill
        
        sv.addArrangedSubview(tf)
        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        sv.addArrangedSubview(line)
        
        NSLayoutConstraint.activate([
            tf.leadingAnchor.constraint(equalTo: sv.leadingAnchor, constant: 0),
            tf.trailingAnchor.constraint(equalTo: sv.trailingAnchor, constant: 0),
            tf.heightAnchor.constraint(equalToConstant: 30),
            line.widthAnchor.constraint(equalTo: sv.widthAnchor),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        return sv
    }
    
    private func createTextField(_ placeholderText: String) -> UITextField {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
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
