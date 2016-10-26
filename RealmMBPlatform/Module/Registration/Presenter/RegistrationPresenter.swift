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
    func register(userName: String, password: String) {
        self.interactor?.registration(userName: userName, password: password)
    }
}
