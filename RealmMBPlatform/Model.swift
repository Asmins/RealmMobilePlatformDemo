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
