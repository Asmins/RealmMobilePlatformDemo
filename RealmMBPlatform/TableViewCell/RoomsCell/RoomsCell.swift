//
//  RoomsCell.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RoomsCell: UITableViewCell {

    var id = ""
    
    @IBOutlet var nameGroupLabel: UILabel!
    @IBOutlet var authorMessageLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(name:String,author:String,message:String,id:String) {
        nameGroupLabel.text = name
        authorMessageLabel.text = author
        messageLabel.text = message
        self.id = id
    }
}
