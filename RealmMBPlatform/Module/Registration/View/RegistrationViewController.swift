//
//  RegistrationViewController.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import SCLAlertView
import RealmSwift

class RegistrationViewController: UIViewController {

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var textFieldConfirmPassword: UITextField!

    var presenter: RegistrationPresenter?
    var navigation: RegistrationWireframe?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.setupNavController(navController: navigationController!)
        self.setupUI()
    }
    
    @IBAction func doneButton(_ sender: AnyObject) {
        self.presenter?.registration(userName: textFieldName.text!, password: textFieldPassword.text!, confirmPassword: textFieldConfirmPassword.text!, firstAction: {
                self.navigation?.dismiss(viewController: self)
            }, secondAction: {
                let alert = SCLAlertView()
                alert.showError("Error", subTitle: "Your have some problem with data")
        })
    }
}

extension RegistrationViewController {
    func setupUI() {
        _ = UIImage.gif(name: "night")
        imageView.loadGif(name: "night")
        textFieldName.layer.borderColor = UIColor.white.cgColor
        textFieldPassword.layer.borderColor = UIColor.white.cgColor
        textFieldConfirmPassword.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.borderColor = UIColor.white.cgColor
    }
}
