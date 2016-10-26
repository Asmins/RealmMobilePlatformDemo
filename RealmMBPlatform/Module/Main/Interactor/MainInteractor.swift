//
//  MainInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 24.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation
import RealmSwift

class MainInteractor {
    var username:String!
    var message = [Message]()
    var realm:Realm!
    var notificationToken: NotificationToken!
}

extension MainInteractor: MainInteractorProtocol {
    
    func addNewTask(text:String) {
        try! realm.write {
            realm.add(Message(value: [text,username!]))
        }
    }
    
    func synchronizeData(userName: String, password: String,tableView:UITableView) {
        let url = URL(string: "http://127.0.0.1:9080")
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        username = userName
        SyncUser.authenticate(with: Credential.usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: { user,error in
            let user = user
            
            if user == nil {
                fatalError(String(describing: error))
            }
            
            let configuration = Realm.Configuration(
                syncConfiguration: (user!, URL(string: "realm://127.0.0.1:9080/all/messages")!)
            )
            
            self.realm = try! Realm(configuration: configuration)
            
            func updateList() {
                
                self.message = Array(self.realm.objects(Message.self))
                tableView.reloadData()
            }
            updateList()
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        })
    }
}
