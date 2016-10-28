//
//  RegistrationViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RealmSwift

class RegistrationViewController: UIViewController {

    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!

    var presenter: RegistrationPresenter?
    var navigation: RegistrationWireframe?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
    }
    
    @IBAction func doneButton(_ sender: AnyObject) {
        self.presenter?.register(userName: textFieldName.text!, password: textFieldPassword.text!)
        self.navigation?.dismiss(viewController: self)
    }
}
