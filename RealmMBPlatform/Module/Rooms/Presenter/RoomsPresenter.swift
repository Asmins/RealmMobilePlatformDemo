//
//  RoomsPresenter.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RoomsPresenter {
    var interactor:RoomsInteractor?
}

extension RoomsPresenter: RoomsPresenterProtocol {
    func syncData(userName: String, password: String, tableView: UITableView){
        self.interactor?.synchronizeData(userName: userName, password: password, tableView: tableView)
    }
    
    func setupCell(cell:RoomsCell,indexPath:NSIndexPath){
        cell.config(name: (self.interactor?.rooms[indexPath.row].nameRooms)!, type: (self.interactor?.rooms[indexPath.row].type)!, access: (self.interactor?.rooms[indexPath.row].access)!, id: cell.id)
    }

    func numberOfItem() -> Int {
        return (self.interactor?.rooms.count)!
    }
    
    func access(indexPath:NSIndexPath,firstAction:()->(),secondAction:()->()) {
       self.interactor?.access(indexPath: indexPath, firstAction: firstAction, secondAction: secondAction)
    }
    func checkPassword(password:String,indexPath:NSIndexPath,action:()->()) {
        self.interactor?.checkPassword(password: password, indexPath: indexPath, action: action)
    }
}
