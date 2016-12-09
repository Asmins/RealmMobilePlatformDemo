//
//  LoginInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import RealmSwift
import SCLAlertView

class LoginInteractor {
    
}

extension LoginInteractor: LoginInteractorProtocol  {
    
    func checkText(userName: UITextField, password: UITextField,action:() -> ()) -> Bool{
        if (userName.text == "") && password.text == "" {
             return true
        }else{
            action()
            return false
        }
    }
    
    func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailText = NSPredicate(format:"SELF MATCHES %@",emailRegEx)
        if emailText.evaluate(with: email) == false {
            let alert = SCLAlertView()
            alert.showError("Error", subTitle: "Invalid email")
        }
        return emailText.evaluate(with: email)
    }
}
