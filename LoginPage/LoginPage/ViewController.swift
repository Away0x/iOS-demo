//
//  ViewController.swift
//  LoginPage
//
//  Created by 吴彤 on 2021/5/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func codeBtnClicked(_ sender: UIButton) {
        let vc = CodeLoginVC()
        vc.view.frame = UIScreen.main.bounds
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @IBAction func snapkitBtnClicked(_ sender: UIButton) {
        let vc = SnapKitLoginVC()
        vc.view.frame = UIScreen.main.bounds
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

