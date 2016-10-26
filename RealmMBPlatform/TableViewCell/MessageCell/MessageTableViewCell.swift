//
//  MessageTableViewCell.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(messageText:String,author:String,currentUser:String) {
        if author == currentUser {
            messageLabel.textAlignment = .right
            userNameLabel.textAlignment = .right
            messageLabel.text = messageText
            userNameLabel.text = author
        }else{
            messageLabel.textAlignment = .left
            userNameLabel.textAlignment = .left
            messageLabel.text = messageText
            userNameLabel.text = author
        }
    }
}
