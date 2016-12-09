//
//  LoginProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol LoginInteractorProtocol {
    func checkText(userName:UITextField,password:UITextField,action:() -> ()) -> Bool
    func validateEmail(email:String) -> Bool
}
