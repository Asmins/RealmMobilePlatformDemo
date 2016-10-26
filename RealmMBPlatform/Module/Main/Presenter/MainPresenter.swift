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
}

extension MainPresenter: MainPresenterProtocol {
    
    func addItem(text: String) {
        self.interactor?.addNewTask(text: text)
    }
    
    func syncData(userName: String, password: String, tableView: UITableView) {
        self.interactor?.synchronizeData(userName: userName, password: password, tableView: tableView)
    }
    
    func setupCell(cell:UITableViewCell,indexPath:NSIndexPath) {
        cell.textLabel?.text = self.interactor?.message[indexPath.row].textMessage
    }
    
    func numberOfItem() -> Int {
        return (self.interactor?.message.count)!
    }
}
