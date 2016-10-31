//
//  RoomsWireframeProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol RoomsWireframeProtocol {
    func popView(viewController:UIViewController)
    func showCreateView(userName:String,password:String)
    func showMainView(userName:String,password:String,idRoom:String)
}
