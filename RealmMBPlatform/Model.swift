//
//  Model.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import RealmSwift

class Message: Object {
    dynamic var textMessage = ""
    dynamic var user = ""
}

class Rooms: Object {
    dynamic var nameRooms = ""
    dynamic var type = ""
    dynamic var password = ""
    dynamic var roomID = ""
}
