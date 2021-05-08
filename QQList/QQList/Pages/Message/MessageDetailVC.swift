//
//  MessageDetailVC.swift
//  QQList
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit

class MessageDetailVC: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var labelText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }

}
