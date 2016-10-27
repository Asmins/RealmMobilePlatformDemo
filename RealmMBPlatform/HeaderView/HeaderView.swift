//
//  HeaderView.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configHeader(header:HeaderView,section:Int){
        switch section {
        case 0:
            header.titleLabel.text = "Enter a name room"
        case 1:
            header.titleLabel.text = "Enter interests"
        case 2:
            header.titleLabel.text = "Access to the room"
        case 3:
            header.titleLabel.text = "Password if need"
        default:
            print("Error")
        }
    }
}
