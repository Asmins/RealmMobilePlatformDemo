//
//  RegistrationWireframe.swift
//  RealmMBPlatform
//
//  Created by admin on 26.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RegistrationWireframe {
    var registerView:RegistrationViewController?
}

extension RegistrationWireframe: RegistrationWireframeProtocol {
    func dismiss(viewController: UIViewController) {
        viewController.navigationController?.popToRootViewController(animated: true)
    }
}
