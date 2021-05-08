//
//  MessageCell.swift
//  QQList
//
//  Created by 吴彤 on 2021/5/8.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var info: MessageItem? = nil {
        didSet {
            avatarImageView.image = info?.img
            nameLabel.text = info?.name
            timeLabel.text = info?.time
            descLabel.text = info?.desc
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.width / 2
        self.avatarImageView.layer.masksToBounds = true
    }

}
