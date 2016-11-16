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
       // if self.interactor?.message.isEmpty != true {
            cell.config(name: (self.interactor?.rooms[indexPath.row].nameRooms)!, author: "", message: "", id: (self.interactor?.rooms[indexPath.row].roomID)!)
            print(self.interactor?.message.last)
       // }
    }
    
    func numberOfItem() -> Int {
        return (self.interactor?.rooms.count)!
    }
    
    func access(indexPath:NSIndexPath,label:RoomsCell,firstAction:()->(),secondAction:()->()) {
        self.interactor?.access(indexPath: indexPath,label: label, firstAction: firstAction, secondAction: secondAction)
    }
    
    func checkPassword(password:String,indexPath:NSIndexPath,action:()->()) {
        self.interactor?.checkPassword(password: password, indexPath: indexPath, action: action)
    }
    
    func setupNavController(navigationController:UINavigationController) {
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.backgroundColor = UIColor.black
    }
    
//    func getMessageFromRoom(userName:String,password:String,idRoom:String,tableView:UITableView) {
//        self.interactor?.getMessageFromRoom(userName: userName, password: password, idRoom: idRoom, tableView: tableView)
//    }
}
