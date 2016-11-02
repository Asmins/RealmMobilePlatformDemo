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

    func setupNavController(navController: UINavigationController) {
        navController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont(name: "Bradley Hand", size: 24)!]
    }
}
