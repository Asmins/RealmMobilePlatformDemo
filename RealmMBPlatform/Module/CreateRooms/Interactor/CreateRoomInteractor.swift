//
//  CreateRoomInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RealmSwift

class CreateRoomInteractor {
    var realm = try! Realm()
}
extension CreateRoomInteractor: CreateRoomInteractorProtocol {
    
    func addRoom(room: Room) {
        try! realm.write {
            realm.add(Rooms(value: [room.nameRoom,room.type,room.acesses,room.password]))
        }
    }
}
