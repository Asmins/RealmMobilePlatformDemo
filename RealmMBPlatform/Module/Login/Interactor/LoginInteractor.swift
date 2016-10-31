//
//  LoginInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import RealmSwift

class LoginInteractor {
    
}

extension LoginInteractor: LoginInteractorProtocol  {
    
    func checkText(userName: UITextField, password: UITextField,action:() -> ()) -> Bool{
        if (userName.text != nil) && password.text == "" {
             return true
        }else{
            action()
            return false
        }
    }
}
