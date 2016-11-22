//
//  AccessRoomCell.swift
//  RealmMBPlatform
//
//  Created by admin on 23.11.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AccessRoomCell: UITableViewCell {

    @IBOutlet var switchAccess: UISwitch!
    @IBOutlet var labelForTypeAccess: UILabel!
    
    var acess:String?
    var variable = Variable<Bool?>(false)
    var disposeBag = DisposeBag()
    var accessType:Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        switchAccess.rx.value.bindTo(variable).addDisposableTo(disposeBag)
        variable.asObservable().subscribe(onNext: { value in
            if value == true {
                self.accessType = true
            }else{
                self.accessType = false
            }
        })
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func actionSwitch(_ sender: AnyObject) {
        acess = switchFunc()
    }

    func switchFunc() -> String {
        if switchAccess.isOn {
            return "Private"
        }else{
            return "Public"
        }
    }
}
