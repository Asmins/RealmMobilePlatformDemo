//
//  RegistrationInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RealmSwift

class RegistrationInteractor {
    
}

extension RegistrationInteractor: RegistrationInteractorProtocol {
    
    func registration(userName:String,password:String,confirmPassword:String,firstAction:()->(),secondAction:()->()) {
        if userName != "" && password != "" {
            if password == confirmPassword {
                SyncUser.authenticate(with: .usernamePassword(username: userName, password: password, actions: .createAccount), server: URL(string: "http://127.0.0.1:9080")! , onCompletion: {_,_ in })
                firstAction()
            }else{
                secondAction()
            }
        }else{
            secondAction()
        }
    }
}
