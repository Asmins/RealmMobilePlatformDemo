//
//  RoomsInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
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
            let user = user
            
            if user == nil {
                fatalError(String(describing: error))
            }
            
            let configuration = Realm.Configuration(
                syncConfiguration: (user!, URL(string: "realm://127.0.0.1:9080/all/rooms")!)
            )
            
            self.realm = try! Realm(configuration: configuration)
            
            func updateList() {
                print(self.realm.objects(Rooms))
                self.rooms = Array(self.realm.objects(Rooms.self))
                tableView.reloadData()
            }
            updateList()
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        })

    }
}
