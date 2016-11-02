//
//  RegistrationInteractorProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation

protocol RegistrationInteractorProtocol {
    func registration(userName:String,password:String,confirmPassword:String,firstAction:()->(),secondAction:()->())
}
