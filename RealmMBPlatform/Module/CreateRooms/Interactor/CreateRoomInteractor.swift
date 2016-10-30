//
//  CreateRoomInteractor.swift
//  RealmMBPlatform
//
//  Created by admin on 27.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RealmSwift

class CreateRoomInteractor {
    var rooms = [Rooms]()
    var notificationToken: NotificationToken!
    var realm:Realm!
}
extension CreateRoomInteractor: CreateRoomInteractorProtocol {
    
    func synchronizeData(userName: String, password: String) {
       let url = URL(string: "http://127.0.0.1:9080")
        SyncUser.authenticate(with: .usernamePassword(username: userName, password: password, actions: []), server: url!, onCompletion: {user,error in
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
        //        self.rooms = Array(self.realm.objects(Rooms.self))
            }
            updateList()
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        })
    }
    
    func addRoom(room: Room) {
        try! realm.write {
            realm.add(Rooms(value: [room.nameRoom,room.type,room.acesses,room.password]))
        }
    }
    
    func add(name: String, type: String, password: String) {
        if password == "" {
            try! realm.write {
                realm.add(Rooms(value: [name,type,"publick","0"]))
            }
        }else{
            try! realm.write {
                realm.add(Rooms(value: [name,type,"private",password]))
            }
        }
    }
    
    func checkToEmpty(name: String, type: String, value: Int, password: String) {
        if name.isEmpty == false && type.isEmpty == false {
            //Chect private or publick
            if value == 0 {
                if password != "" {
                    self.add(name: name, type: type, password: password)
                }else{
                    print("Enter password")
                }
            }else{
                self.add(name: name, type: type, password: "0")
                print("Save")
            }
        }else{
            print("Not save")
            print("Enter all fields")
        }
    }
}
