//
//  CreateRoomcCell.swift
//  RealmMBPlatform
//
//  Created by admin on 23.11.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CreateRoomCell: UITableViewCell {

    @IBOutlet var mainTextField: UITextField!
    
    var disposeBag = DisposeBag()
    var textInTextField:String?
    var textVariable = Variable<String?>("")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTextField.rx.text.bindTo(textVariable).addDisposableTo(disposeBag)
        textVariable.asObservable().subscribe(onNext: { text in
            self.textInTextField = text!
        })
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
