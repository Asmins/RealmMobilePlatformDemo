//
//  CreateViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var textFieldForPassword: UITextField!
    @IBOutlet var segmentController: UISegmentedControl!
    @IBOutlet var textFieldForTypeRoom: UITextField!
    @IBOutlet var textFieldForNameRoom: UITextField!
    
    var presenter: CreateRoomPresenter?
    var navigation: CreateRoomWireframe?
    
    var userName:String?
    var password:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.synchronizeData(userName: userName!, password: password!)
        self.title = "Create room"
        self.presenter?.access(segmentController: segmentController, textField: textFieldForPassword)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonAction(_ sender: AnyObject) {
        self.presenter?.checkToEmpty(name: textFieldForNameRoom.text!, type: textFieldForTypeRoom.text!, value: segmentController.selectedSegmentIndex, password: textFieldForPassword.text!,action: {
            self.navigation?.dismiss(viewController: self)
        })
    }
    
}
