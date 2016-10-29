//
//  CreateViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class CreateViewController: UIViewController {
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textFieldForPassword: UITextField!
    @IBOutlet var segmentController: UISegmentedControl!
    @IBOutlet var textFieldForTypeRoom: UITextField!
    @IBOutlet var textFieldForNameRoom: UITextField!
    
    var presenter: CreateRoomPresenter?
    var disposeBag = DisposeBag()
    var someVar = Variable<Int>(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create room"
        segmentController.rx.value.bindTo(someVar).addDisposableTo(disposeBag)
        
        someVar.asObservable().subscribe(onNext: { value in
            if value == 1 {
                self.textFieldForPassword.isEnabled = false
                self.textFieldForPassword.placeholder = "Only for private room"
            }
        }).addDisposableTo(disposeBag)
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButtonAction(_ sender: AnyObject) {
          print("Save")
    }
}
