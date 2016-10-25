//
//  LoginWireframeProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation

protocol LoginWireframeProtocol {
    func showLoginView()
    func showMainView(userName:String,password:String)
}
