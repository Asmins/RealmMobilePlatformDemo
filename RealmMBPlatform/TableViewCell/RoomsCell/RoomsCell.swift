//
//  RoomsCell.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RoomsCell: UITableViewCell {

    @IBOutlet var countLabel: UILabel!
    @IBOutlet var nameRoomsLabel: UILabel!
    @IBOutlet var imageRooms: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
