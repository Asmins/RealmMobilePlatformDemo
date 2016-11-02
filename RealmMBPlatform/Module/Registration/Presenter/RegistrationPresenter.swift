//
//  RegistrationPresenter.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RegistrationPresenter {
    var interactor:RegistrationInteractor?
}

extension RegistrationPresenter:RegistrationPresenterProtocol {
    
    func registration(userName:String,password:String,confirmPassword:String,firstAction:()->(),secondAction:()->()){
        self.interactor?.registration(userName: userName, password: password, confirmPassword: confirmPassword, firstAction: firstAction, secondAction: secondAction)
    }
    
    func setupNavController(navController:UINavigationController){
        navController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navController.navigationBar.shadowImage = UIImage()
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.tintColor = UIColor.white
        navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont(name: "Bradley Hand", size: 24)!]
    }
}
