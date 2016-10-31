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
    func access(indexPath:NSIndexPath,firstAction:()->(),secondAction:()->())
    func checkPassword(password:String,indexPath:NSIndexPath,action:()->())
}
