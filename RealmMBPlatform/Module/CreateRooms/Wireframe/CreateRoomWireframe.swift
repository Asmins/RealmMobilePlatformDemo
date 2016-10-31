//
//  CreateRoomWireframe.swift
//  RealmMBPlatform
//
//  Created by admin on 31.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class CreateRoomWireframe {
    
}
extension CreateRoomWireframe: CreateRoomWireframeProtocol {
    func dismiss(viewController: UIViewController) {
        viewController.navigationController?.popViewController(animated: true)
    }
}
