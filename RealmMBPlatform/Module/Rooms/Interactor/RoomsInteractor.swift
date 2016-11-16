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
    var message = [Message]()
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
                    tableView.reloadData()
                }
                updateList()
                self.notificationToken = self.realm.addNotificationBlock { _ in
                    updateList()
                }
            }
        })
    }
   /*
    func getMessageFromRoom(userName: String, password: String,idRoom:String, tableView: UITableView) {
        let url = URL(string: "http://127.0.0.1:9080")
        username = userName
        SyncUser.authenticate(with: .usernamePassword(username: username, password: password, actions: []), server: url!, onCompletion: { user,_ in
            let configuration = Realm.Configuration(syncConfiguration: (user!, URL(string: "realm://127.0.0.1:9080/\(idRoom)/messages")!))
            
            self.realm = try! Realm(configuration: configuration)
            
            func updateArray() {
                self.message = Array(self.realm.objects(Message.self))
                tableView.reloadData()
            }
            updateArray()
            self.notificationToken = self.realm.addNotificationBlock({ _ in
                updateArray()
            })
        })
    }*/

    func access(indexPath:NSIndexPath,label:RoomsCell,firstAction:()->(),secondAction:()->()) {
        if rooms[indexPath.row].access == "Private" {
            firstAction()
          //  label.typeRoomLabel.text = "It is fucking private room"
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
