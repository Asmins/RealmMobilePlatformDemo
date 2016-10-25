//
//  LoginView.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class LoginPresenter {
    var interactor:LoginInteractor?
}

extension LoginPresenter: LoginPresenterProtocol {
    func checkTextField(userName: UITextField, password: UITextField,action:() -> ()) -> Bool {
        return (self.interactor?.checkText(userName: userName, password: password,action: action))!
    }
}
