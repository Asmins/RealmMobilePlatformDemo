//
//  MainInteractorProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol MainInteractorProtocol {
    func addNewTask(text:String)
    func clean(textField:UITextField)
    func synchronizeData(userName:String,password:String,tableView:UITableView,id:Int,indicator:UIActivityIndicatorView,view:UIView)
}
