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
    @IBOutlet var dataLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(messageText:String,author:String,currentUser:String,date:String) {
        if author == currentUser {
            messageLabel.textAlignment = .right
            userNameLabel.textAlignment = .right
            dataLabel.textAlignment = .right
        }else{
            messageLabel.textAlignment = .left
            userNameLabel.textAlignment = .left
            dataLabel.textAlignment = .left
        }
        messageLabel.text = messageText
        userNameLabel.text = author
        dataLabel.text = date
    }
}
