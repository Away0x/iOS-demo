//
//  FriendCell.swift
//  QQList
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit

class FriendCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    
    var info: FriendItem? = nil {
        didSet {
            titleLabel.text = info?.title
            numLabel.text = info?.num
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
