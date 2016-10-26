//
//  MainPresenterProtocol.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol MainPresenterProtocol {
    func addItem(text:String)
    func numberOfItem() -> Int
    func setupCell(cell:UITableViewCell,indexPath:NSIndexPath)
    func syncData(userName:String,password:String,tableView:UITableView)
}
