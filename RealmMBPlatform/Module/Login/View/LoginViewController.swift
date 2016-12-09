//
//  LoginViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class LoginViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var registerButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var textFieldForEmail: UITextField!
    @IBOutlet var textFieldForPassword: UITextField!
   
    var presenter:LoginPresenter?
    var navigation:LoginWireframe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setupNavController(navController: navigationController!)
        self.setupUI()
        textFieldForEmail.delegate = self
        print(Server().url)
    }
  
    @IBAction func loginButton(_ sender: AnyObject) {
        self.presenter?.checkTextField(userName: textFieldForEmail, password: textFieldForPassword, action: {
            self.navigation?.showMainView(userName: textFieldForEmail.text!, password: textFieldForPassword.text!)
        })
    }
    
    @IBAction func registerButton(_ sender: AnyObject) {
        self.navigation?.showRegistrView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        textFieldForEmail.text = ""
        textFieldForPassword.text = ""
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.presenter?.validateEmail(email: textField.text!)
    }
}

extension LoginViewController {
   
    func setupUI(){
        title = "Log In"
        let gifImage = UIImage.gif(name: "loginScreenGif")
        imageView.loadGif(name: "loginScreenGif")
        textFieldForEmail.layer.borderColor = UIColor.white.cgColor
        textFieldForPassword.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderColor = UIColor.white.cgColor
        registerButton.layer.borderColor = UIColor.white.cgColor
    }
}
