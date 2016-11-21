//
//  RoomsPresenterProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol RoomsPresenterProtocol {
    func checkPassword(password:String,indexPath:NSIndexPath,action:()->())
    func access(indexPath:NSIndexPath,label:RoomsCell,firstAction:()->(),secondAction:()->())
    func numberOfItem() -> Int 
    func setupCell(cell:RoomsCell,indexPath:NSIndexPath)
    func syncData(userName: String, password: String, tableView: UITableView,activityIndicator:UIActivityIndicatorView,view:UIView)
    func setupNavController(navigationController:UINavigationController)
    //func getMessageFromRoom(userName:String,password:String,idRoom:String,tableView:UITableView)
}
