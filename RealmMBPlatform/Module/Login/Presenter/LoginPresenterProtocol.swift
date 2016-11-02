//
//  LoginViewProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol {
    func setupNavController(navController:UINavigationController)
    func checkTextField(userName:UITextField,password:UITextField,action:() -> ()) -> Bool
}
