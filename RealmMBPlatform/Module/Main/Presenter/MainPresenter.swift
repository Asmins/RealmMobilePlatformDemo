//
//  MainPresenter.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class MainPresenter {
    var interactor:MainInteractor?
    
    func some(textField:UITextField){
        self.interactor?.some(textField: textField)
    }
}

extension MainPresenter: MainPresenterProtocol {

    func addItem(text:String) {
        self.interactor?.addNewTask(text: text)
    }

    func clean(textField: UITextField) {
        self.interactor?.clean(textField: textField)
    }
    
    func syncData(userName: String, password: String, tableView: UITableView,id:Int,indicator:UIActivityIndicatorView,view:UIView) {
        self.interactor?.synchronizeData(userName: userName, password: password, tableView: tableView, id: id,indicator: indicator,view:view)
    }
    
    func numberOfItem() -> Int {
        return (self.interactor?.messages.count)!
    }
    
    func setupCell(cell: MessageTableViewCell, indexPath: NSIndexPath,userName:String) {
        cell.configCell(messageText: (self.interactor?.messages[indexPath.row].textMessage)!, author: (self.interactor?.messages[indexPath.row].user)!, currentUser: userName)
    }
    
    func setupNavController(navigationController:UINavigationController) {
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.backgroundColor = UIColor.black
    }
}
