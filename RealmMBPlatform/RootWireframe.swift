//
//  RootWireframe.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RootWireframe {

    let loginWireframe = LoginWireframe()
    
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?,window:UIWindow) -> Bool {
        self.loginWireframe.window = window
        self.loginWireframe.showLoginView()
        return true
    }
}
