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
    
    func syncData(userName: String, password: String, tableView: UITableView,id:String) {
        self.interactor?.synchronizeData(userName: userName, password: password, tableView: tableView, id: id)
    }
    
    func numberOfItem() -> Int {
        return (self.interactor?.message.count)!
    }
    
    func setupCell(cell: MessageTableViewCell, indexPath: NSIndexPath,userName:String) {
        cell.configCell(messageText: (interactor?.message[indexPath.row].textMessage)!,
                        author: (interactor?.message[indexPath.row].user)!,
                        currentUser: userName)
    }
}
