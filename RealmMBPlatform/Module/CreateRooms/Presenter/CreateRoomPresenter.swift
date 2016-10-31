//
//  CreateRoomPresenter.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class CreateRoomPresenter {
    var interactor:CreateRoomInteractor?
}
extension CreateRoomPresenter: CreateRoomPresenterProtocol {
    func checkToEmpty(name: String, type: String, value: Int, password: String) {
        self.interactor?.checkToEmpty(name: name, type: type, value: value, password: password)
    }
    
    func synchronizeData(userName: String, password: String) {
        self.interactor?.synchronizeData(userName: userName, password: password)
    }
    func access(segmentController: UISegmentedControl, textField: UITextField) {
        self.interactor?.access(segmentController: segmentController, textField: textField)
    }
}
