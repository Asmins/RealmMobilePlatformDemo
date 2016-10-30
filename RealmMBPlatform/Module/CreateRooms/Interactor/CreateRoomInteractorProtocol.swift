//
//  CreateRoomInteractorProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol CreateRoomInteractorProtocol {
    func add(name:String,type:String,password:String)
    func checkToEmpty(name:String,type:String,value:Int,password:String)
    func synchronizeData(userName:String,password:String)
}
