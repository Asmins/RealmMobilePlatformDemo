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
    func add(room: Room) {
        self.interactor?.addRoom(room: room)
    }
}
