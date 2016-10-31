//
//  LoginViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var textFieldForEmail: UITextField!
    @IBOutlet var textFieldForPassword: UITextField!
   
    var presenter:LoginPresenter?
    var navigation:LoginWireframe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    @IBAction func loginButton(_ sender: AnyObject) {
        self.presenter?.checkTextField(userName: textFieldForEmail, password: textFieldForPassword, action: {
            self.navigation?.showMainView(userName: textFieldForEmail.text!, password: textFieldForPassword.text!)
        })
    }
    @IBAction func registerButton(_ sender: AnyObject) {
        self.navigation?.showRegistrView()
    }
/*
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        textFieldForEmail.text = ""
        textFieldForPassword.text = ""
    }
 */
}
