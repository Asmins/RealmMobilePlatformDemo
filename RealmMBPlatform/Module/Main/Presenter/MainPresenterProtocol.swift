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
    func clean(textField:UITextField)
    func numberOfItem() -> Int
    func setupCell(cell:MessageTableViewCell,indexPath:NSIndexPath,userName:String)
    func syncData(userName:String,password:String,tableView:UITableView,id:Int,indicator:UIActivityIndicatorView,view:UIView,navItem:UINavigationItem)
    func setupViewController(viewController:UIViewController)
    func setupNavController(navigationController:UINavigationController)
}
