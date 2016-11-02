//
//  RegistrationPresenterProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol RegistrationPresenterProtocol {
    func setupNavController(navController:UINavigationController)
    func registration(userName:String,password:String,confirmPassword:String,firstAction:()->(),secondAction:()->())
}
