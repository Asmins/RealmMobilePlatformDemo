//
//  RoomsInteractorProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol RoomsInteractorProtocol {
    func synchronizeData(userName:String,password:String,tableView:UITableView)
    func access(indexPath:NSIndexPath,label:RoomsCell,firstAction:()->(),secondAction:()->())
    func checkPassword(password:String,indexPath:NSIndexPath,action:()->())
    //func getMessageFromRoom(userName:String,password:String,idRoom:String,tableView:UITableView)
}
