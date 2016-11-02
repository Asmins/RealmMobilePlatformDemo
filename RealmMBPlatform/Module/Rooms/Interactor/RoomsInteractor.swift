//
//  RoomsInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import SCLAlertView
import RealmSwift

class RoomsInteractor {
    var rooms = [Rooms]()
    var realm:Realm!
    var notificationToken: NotificationToken!
    var username:String!
}

extension RoomsInteractor: RoomsInteractorProtocol {
    func synchronizeData(userName: String, password: String, tableView: UITableView) {
        let url = URL(string: "http://127.0.0.1:9080")
        username = userName
        SyncUser.authenticate(with: Credential.usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: { user,error in
            
            if user == nil {
                let alert = SCLAlertView()
                alert.showError("Error", subTitle: "User not found")
            }else{
                let configuration = Realm.Configuration(syncConfiguration: (user!, URL(string: "realm://127.0.0.1:9080/all/rooms")!)
                )
                self.realm = try! Realm(configuration: configuration)
              
                func updateList() {
                    self.rooms = Array(self.realm.objects(Rooms.self))
                    var message = Array(self.realm.objects(Message.self))
                    tableView.reloadData()
                }
                updateList()
                self.notificationToken = self.realm.addNotificationBlock { _ in
                    updateList()
                }
            }
        })
    }

    func access(indexPath:NSIndexPath,firstAction:()->(),secondAction:()->()) {
        if rooms[indexPath.row].access == "Private" {
            firstAction()
        }else{
            secondAction()
        }
    }
    
    func checkPassword(password:String,indexPath:NSIndexPath,action:()->()){
        if password == self.rooms[indexPath.row].password {
            action()
        }
    }
}
